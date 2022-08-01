class Covid::WellnessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wellness, only: %i[ show edit update destroy ]

  # GET /wellnesses or /wellnesses.json
  def index
    @wellnesses = Wellness.all
    if current_user.position.department.in? ["Administration", "Office"]
      @wellenesses
    elsif (current_user.position.name.in? ["Operations Manager", "Supervisor", "General Manager", "Manager", "Maint Department Head", "AA", "PM Department Head", "Technology Department Head", "Maint Tech Department Head"]) &&(@wellness.store.in? current_user.stores)
      @wellnesses.where(store_id: current_user.store_ids)
    else
      redirect_to dashboard_path, alert: "You can only view wellness checks under your supervision"
    end
    authorize Wellness
  end

  # GET /wellnesses/1 or /wellnesses/1.json
  def show
    authorize @wellness
    if current_user.position.department.in? ["Administration", "Office"]
      @welleness
    elsif (current_user.position.name.in? ["Operations Manager", "Supervisor", "General Manager", "Manager", "Maint Department Head", "AA", "PM Department Head", "Technology Department Head", "Maint Tech Department Head"]) &&(@wellness.store.in? current_user.stores)
      @wellness
    else
      redirect_to dashboard_path, alert: "You can only view wellness checks under your supervision"
    end
  end

  # GET /wellnesses/new
  def new
    @wellness = Wellness.new
    authorize @wellness
  end

  # GET /wellnesses/1/edit
  def edit
    authorize @wellness
  end

  # POST /wellnesses or /wellnesses.json
  def create
    @wellness = Wellness.new(wellness_params)
    authorize @wellness
    @wellness.organization = current_user.organization

    respond_to do |format|
      if @wellness.save
        WellnessMailer.sick(@wellness).deliver_later if sick(params)
        format.html { redirect_to wellness_path(@wellness), notice: "Wellness was successfully created." }
        format.json { render :show, status: :created, location: @wellness }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wellness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wellnesses/1 or /wellnesses/1.json
  def update
    authorize @wellness
    respond_to do |format|
      if @wellness.update(wellness_params)
        format.html { redirect_to wellness_url(@wellness), notice: "Wellness was successfully updated." }
        format.json { render :show, status: :ok, location: @wellness }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wellness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wellnesses/1 or /wellnesses/1.json
  def destroy
    authorize @wellness
    @wellness.destroy

    respond_to do |format|
      format.html { redirect_to wellnesses_url, notice: "Wellness was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wellness
      @wellness = Wellness.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wellness_params
      params.require(:wellness).permit(:organization_id, :store_id, :first_name, :last_name, :tc, :temp, :q1, :q2, :q3, :q4, :reported)
    end

    def sick(answers)
      sick = answers['wellness']['q1'].to_i + answers['wellness']['q2'].to_i + answers['wellness']['q3'].to_i + answers['wellness']['q4'].to_i
      sick > 0 || (answers['wellness']['temp'].to_f > 99.6)
    end
end
