class NewHiresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_new_hire, only: %i[ show edit update destroy ]

  # GET /new_hires or /new_hires.json
  def index
    @new_hires = NewHire.where(attended: false)
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
    @new_hire.destroy

    respond_to do |format|
      format.html { redirect_to new_hires_url, notice: "New hire was successfully destroyed." }
      format.json { head :no_content }
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
