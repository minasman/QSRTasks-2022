class Maintenance::Equipment::EquipmentAreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_equipment_area, only: %i[ show edit update destroy ]

  # GET /equipment_areas or /equipment_areas.json
  def index
    @equipment_areas = EquipmentArea.all
  end

  # GET /equipment_areas/1 or /equipment_areas/1.json
  def show
  end

  # GET /equipment_areas/new
  def new
    @equipment_area = EquipmentArea.new
  end

  # GET /equipment_areas/1/edit
  def edit
  end

  # POST /equipment_areas or /equipment_areas.json
  def create
    @equipment_area = EquipmentArea.new(equipment_area_params)
    @equipment_area.organization = current_user.organization
    respond_to do |format|
      if @equipment_area.save
        format.html { redirect_to equipment_area_url(@equipment_area), notice: "Equipment area was successfully created." }
        format.json { render :show, status: :created, location: @equipment_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_areas/1 or /equipment_areas/1.json
  def update
    respond_to do |format|
      if @equipment_area.update(equipment_area_params)
        format.html { redirect_to equipment_area_url(@equipment_area), notice: "Equipment area was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_areas/1 or /equipment_areas/1.json
  def destroy
    @equipment_area.destroy

    respond_to do |format|
      format.html { redirect_to equipment_areas_url, notice: "Equipment area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_area
      @equipment_area = EquipmentArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_area_params
      params.require(:equipment_area).permit(:name, :organization_id)
    end
end
