class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: %i[ show edit update destroy store_roster]

  # GET /stores or /stores.json
  def index
    @stores = store_list(current_user)
    @stores = @stores.search(params[:query]) if params[:query].present?
    puts @stores
    @pagy, @stores = pagy @stores, items: params.fetch(:count, 10)
    authorize Store
  end

  # GET /stores/1 or /stores/1.json
  def show
    authorize @store
  end

  # GET /stores/new
  def new
    @store = Store.new
    authorize @store
  end

  # GET /stores/1/edit
  def edit
    authorize @store
  end

  # POST /stores or /stores.json
  def create
    @store = Store.new(store_params)
    authorize @store
    @store.organization = current_user.organization
    respond_to do |format|
      if @store.save
        format.html { redirect_to store_url(@store), notice: "Store was successfully created." }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1 or /stores/1.json
  def update
    authorize @store
    respond_to do |format|
      if @store.update(store_params)
        format.html do
          redirect_to store_url(@store), notice: 'Restaurant was successfully updated.'
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

  # DELETE /stores/1 or /stores/1.json
  def destroy
    authorize @store
    store_name = @store.name
    store_id = "store_#{@store.id}"
    @store.update(active: @store.active ? false : true, user_ids: [])
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(store_id) }
    end
  end

  def inactive_stores
    @stores = Store.where(active: false).order( store_type: "DESC", number: "ASC")
    @stores = @stores.search(params[:query]) if params[:query].present?
    puts @stores
    @pagy, @stores = pagy @stores, items: params.fetch(:count, 10)
  end

  def store_roster
    @roster = @store.users.where(position_id: [26, 15])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:name, :number, :street, :city, :state, :zip, :phone, :email, :safe, :headset, :store_type, :active, :organization_id)
    end

    def store_list(c_user)
      if c_user.position.name.in? ["Supervisor", "General Manager", "Manager", "Operations Manager", "Crew"]
        Store.where(id: c_user.store_ids, active: true).order(number: :asc)
      else
        Store.where(organization_id: c_user.organization_id, active: true).order(number: :asc)
      end
    end
end
