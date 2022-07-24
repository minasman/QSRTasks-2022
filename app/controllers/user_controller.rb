class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = user_list(true)
    @users = @users.search(params[:query]) if params[:query].present?
    @pagy, @users = pagy @users.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
    authorize User
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
    if current_user.position.department == "Operations"
      if @user.stores[0].in? current_user.stores
        @stores = current_user.stores.where(active: true).order(number: :asc)
        render :edit
      else
        redirect_back(fallback_location: dashboard_path, alert: 'You Are Not Authorized To Edit Users Not Under Your Supervision')
      end
    elsif @user.position.department == "Maintenance"
      @stores = current_user.stores.where(active: true).order(number: :asc)
      render :edit
    elsif current_user.position.department.in? ['Administration', 'Office']
      @stores = Store.where(active: true).order(number: :asc)
      render :edit
    else
      redirect_back(fallback_location: dashboard_path, alert: 'You Are Not Authorized To Edit Users Not Under Your Supervision')
    end
   end

  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to user_index_url,  notice: 'User was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @store.errors, status: :unprocessable_entity
        end
      end
    end
   end

  def destroy
    authorize @user
    user_name = @user.full_name
    store_list = @user.past_stores.push(@user.stores)
    user_id = "user_#{@user.id}"
    @user.update(active: @user.active ? false : true, store_ids: [], position_id: 26, admin: false, rewards: [], redeemed_rewards: [], accumulated_points: 0, past_stores: store_list)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(user_id) }
    end
   end

   def inactive_users
    @users = user_list(false)
    @users = @users.search(params[:query]) if params[:query].present?
    @pagy, @users = pagy @users.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
   end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :admin, :position_id, :active, :organizations_id, :birthdate, :hire_date, { store_ids: [] }, { tclass_ids: [] })
  end

  def user_list(active)
    users = User.all.where(organization_id: current_user.organization.id, active: active).order('first_name ASC').includes(:stores)
    if current_user.position.department == 'Administration'
      users
    elsif current_user.position.department == 'Operations'
     users =  users.where(stores: { id: current_user.stores.ids },  position_id: Position.where(name: [ 'General Manager', 'Manager', 'Crew']).ids).order(position_id: :asc)
    elsif current_user.position.department == 'Maintenance'
      users = users.where(position_id: Position.where(department: "Maintenance").ids).where.not(id: current_user.id)
    else
      users = users.where(position_id: Position.where(department: "Office").ids).where.not(id: current_user.id)
    end
    users
  end

  def sort_column
    %w{ first_name position_id }.include?(params[:sort]) ? params[:sort] : "position_id"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
  end

end
