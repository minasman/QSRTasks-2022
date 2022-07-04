class Maintenance::Equipment::EquipmentController < ApplicationController
  before_action :authenticate_user!
  before_action :set_equipment, only: %i[ show edit update destroy ]

  # GET /equipment or /equipment.json
  def index
    @equipment = Equipment.all
    authorize Equipment
  end

  # GET /equipment/1 or /equipment/1.json
  def show
    authorize @equipment
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  # GET /equipment/1/edit
  def edit
    authorize @equipment
  end

  # POST /equipment or /equipment.json
  def create
    respond_to do |format|
      if params[:equipment][:store_list][:store_id].size > 1
        tag = Equipment.last.equipment_tag.to_i
        params[:equipment][:store_list][:store_id].each do |store|
          if store.to_i > 1
            tag += 1
            @equipment = Equipment.new(
              name: params[:equipment][:name],
              service_date: params[:equipment][:service_date],
              equipment_area_id: params[:equipment][:equipment_area_id],
              equipment_type_id: params[:equipment][:equipment_type_id],
              store_id: store,
              equipment_tag: tag,
              organization: current_user.organization
            )
            authorize @equipment
            @equipment.save
          end
        end
        format.html { redirect_to dashboard_path, notice: "Equipment was successfully added to #{params[:equipment][:store_list][:store_id].size.to_i - 1} restaurant(s)." }
      else
        @equipment = Equipment.new
        @equipment.errors.add(:store, :missing_store, message: "Missing Store Assignments")
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1 or /equipment/1.json
  def update
    authorize @equipment
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to equipment_url(@equipment), notice: "Equipment was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1 or /equipment/1.json
  def destroy
    authorize @equipment
    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: "Equipment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_equipment
    @target = params[:target]
    @equipment_types = EquipmentType.where(equipment_area_id: params[:equipment_area])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_params
      params.require(:equipment).permit(:name, :service_date, :equipment_tag, :store_id, :equipment_type_id, :equipment_area_id, :organization_id, store_list: [])
    end
end
