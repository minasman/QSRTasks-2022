class Comments::GuestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guest, only: %i[ show edit update destroy ]

  # GET /guests or /guests.json
  def index
    @guests = Guest.all
    @guests = @guests.search(params[:query]) if params[:query].present?
    @pagy, @guests = pagy @guests.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
    authorize Guest
  end

  # GET /guests/1 or /guests/1.json
  def show
    authorize @guest
  end

  # GET /guests/new
  def new
    @guest = Guest.new
    authorize @guest
  end

  # GET /guests/1/edit
  def edit
    authorize @guest
  end

  # POST /guests or /guests.json
  def create
    authorize @guest
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to guest_path(@guest), notice: "Guest was successfully created." }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1 or /guests/1.json
  def update
    authorize @guest
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to guest_path(@guest), notice: "Guest was successfully updated." }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1 or /guests/1.json
  def destroy
    authorize @guest
    @guest.destroy

    respond_to do |format|
      format.html { redirect_to guests_url, notice: "Guest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :phone, :email, :organization_id)
    end

    def sort_column
      %w{ first_name }.include?(params[:sort]) ? params[:sort] : "first_name"
    end

    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end
end
