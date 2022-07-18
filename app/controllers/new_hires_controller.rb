class NewHiresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_new_hire, only: %i[ show edit update destroy ]

  # GET /new_hires or /new_hires.json
  def index
    @new_hires = NewHire.where(attended: false, background_received: true, background_ok: true)
    @new_hires = @new_hires.search(params[:query]) if params[:query].present?
    @pagy, @new_hires = pagy @new_hires.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
    authorize NewHire
  end

  # GET /new_hires/1 or /new_hires/1.json
  def show
  end

  # GET /new_hires/new
  def new
    @new_hire = NewHire.new
    @min_date = min_date
    @max_date = max_date
    authorize @new_hire
  end

  # GET /new_hires/1/edit
  def edit
    @min_date = min_date
    @max_date = max_date
    authorize @new_hire
  end

  # POST /new_hires or /new_hires.json
  def create
    @new_hire = NewHire.new(new_hire_params)
    @new_hire.organization = current_user.organization
    @new_hire.user = current_user
    authorize @new_hire
    respond_to do |format|
      if @new_hire.save
        format.html { redirect_to new_hire_url(@new_hire), notice: "New hire was successfully created." }
        format.json { render :show, status: :created, location: @new_hire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @new_hire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_hires/1 or /new_hires/1.json
  def update
    authorize @new_hire
    respond_to do |format|
      if @new_hire.update(new_hire_params)
        format.html { redirect_to new_hire_url(@new_hire), notice: "New hire was successfully updated." }
        format.json { render :show, status: :ok, location: @new_hire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @new_hire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_hires/1 or /new_hires/1.json
  def destroy
    authorize @new_hire
    new_hire_id = "new_hire_#{@new_hire.id}"
    @new_hire.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(new_hire_id) }
    end
  end

  def verify_rehire
    email = params[:email]
    @target = "rehire-found"
    @rehire = User.find_by(email: email)
    unless @rehire.nil?
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def approve_background
    @new_hires = NewHire.where(attended: false, background_ok: [false]).where(background_na: false).or(NewHire.where(attended: false, background_received: false))
    @new_hires = @new_hires.search(params[:query]) if params[:query].present?
    @pagy, @new_hires = pagy @new_hires.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
  end

  def update_background
    @received = params[:received] == "true" ? true : false
    @approve = params[:approved] == "true" ? true : false
    @not_approved = params[:not_approved] == "true" ? true : false
    @target = params[:target]
    @row = params[:row]
    @new_hire = NewHire.find(@target.delete_prefix("new_hire_"))
    @new_hire.update(background_received: @received, background_ok: @approve, background_na: @not_approved)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def attended
    @target = params[:target]
    new_hire = NewHire.find(@target.delete_prefix("new_hire_"))
    @row = params[:row]
    payroll_id = User.last.payroll_id.to_i + 1
    @user = User.new(first_name: new_hire.first_name, last_name: new_hire.last_name, phone: new_hire.phone, email: new_hire.email, position_id: new_hire.position.id, organization_id: current_user.organization_id, rate: new_hire.rate, payroll_id: payroll_id, password: "stagg#{new_hire.social}", password_confirmation: "stagg#{new_hire.social}", birthdate: new_hire.birthdate, stores: [new_hire.store], hire_date: Date.today)
    if @user.save
      new_hire.update(attended: true)
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  def comment_update
    @target = params[:target]
    @row = params[:row]
    comment = params[:update]
    @new_hire = NewHire.find(@target.delete_prefix("neh-"))
    @new_hire.update(comments: comment)
    puts "THIS IS THE NEW HIRE ID #{@new_hire.id}"
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_hire
      @new_hire = NewHire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def new_hire_params
      params.require(:new_hire).permit(:organization_id, :store_id, :user_id, :first_name, :last_name, :email, :phone, :social, :rate, :birthdate, :position_id, :referred_by, :rehire, :notes, :hear, :attended, :requirements, :background_received, :background_ok, :comments, :background_na)
    end

    def max_date
      (Date.today - 16.years).strftime('%Y-%m-%d')
    end

    def min_date
      (Date.today - 100.years).strftime('%Y-%m-%d')
    end

    def sort_column
      %w{ store_id first_name position_id }.include?(params[:sort]) ? params[:sort] : "store_id"
    end

    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end
end
