class Maintenance::WorkordersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workorder, only: %i[ show edit update destroy ]

  # GET /workorders or /workorders.json
  def index
    if params[:workorder_number]
      @workorder = Workorder.where(id: params[:workorder_number]).first
      redirect_to @workorder, allow_other_host: true
    else
      @workorders = workorder_list
      @csvworkorders = @workorders
      @workorders = @workorders.search(params[:query]) if params[:query].present?
      @pagy, @workorders = pagy @workorders.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
      authorize Workorder
      respond_to do |format|
        format.html
        format.csv { send_data Workorder.to_csv(@csvworkorders), filename: "workorders-#{current_user.full_name}.csv" }
      end
    end
  end

  # GET /workorders/1 or /workorders/1.json
  def show
    authorize @workorder
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Workorder #{@workorder.id}",
        page_size: 'A4',
        template: "workorders/workorders/show.html.erb",
        layout: "pdf.html",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  # GET /workorders/new
  def new
    @workorder = Workorder.new
    authorize @workorder
  end

  # GET /workorders/1/edit
  def edit
    authorize @workorder
  end

  # POST /workorders or /workorders.json
  def create
    @workorder = Workorder.new(workorder_params)
    authorize @workorder
    @workorder.organization = current_user.organization
    @workorder.user = current_user

    respond_to do |format|
      if @workorder.save
        WorkorderMailer.workorder(@workorder).deliver_later
        format.html { redirect_to workorder_path(@workorder), notice: "Workorder was successfully created." }
        format.json { render :show, status: :created, location: @workorder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workorders/1 or /workorders/1.json
  def update
    authorize @workorder
    respond_to do |format|
      if params[:workorder][:status] == "1"
        params[:workorder][:status] = "Open"
      end
      if @workorder.update(workorder_params)
        if @workorder.assigned?
          WorkorderMailer.workorder_assigned(@workorder, current_user.full_name).deliver_later
        end
        format.html { redirect_to workorder_path(@workorder), notice: "Workorder was successfully updated." }
        format.json { render :show, status: :ok, location: @workorder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workorders/1 or /workorders/1.json
  def destroy
    @workorder.destroy

    respond_to do |format|
      format.html { redirect_to workorders_url, notice: "Workorder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_workorders
    @workorders = Workorder.where(status: "Open", assigned: params[:id]).order(level: :asc, store_id: :asc, id: :asc).includes(:store)
  end

  def assign
    @workorders = Workorder.where(assigned: nil, status: 'Open').order(store_id: 'ASC', id: 'ASC')
    @workorders = @workorders.search(params[:query]) if params[:query].present?
    @pagy, @workorders = pagy @workorders.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
  end

  def weekly_recap
    @workorders = Workorder.where(status: 'Open').order('store_id').order('created_at')
    @csvworkorders = @workorders
    @workorders = @workorders.search(params[:query]) if params[:query].present?
    @pagy, @workorders = pagy @workorders.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
    respond_to do |format|
      format.html
      format.csv { send_data Workorder.to_csv(@csvworkorders), filename: "workorders-#{current_user.full_name}.csv" }
    end
  end

  def equipment_types
    @target = params[:target]
    equipment =  Store.find(params[:store]).equipment
    @equipment_types = equipment.where(equipment_area: params[:equipment_area]).map(&:equipment_type).uniq
    respond_to do |format|
      format.turbo_stream
    end
  end

  def equipment_choices
    @target = params[:target]
    @equipment_choices = Store.find(params[:store]).equipment.where(equipment_type: params[:equipment_type])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workorder
      @workorder = Workorder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workorder_params
      params.require(:workorder).permit(:store_id, :user_id, :organization_id, :equipment_id, :equipment_area_id, :equipment_type_id, :workorder_issue, :status, :assigned, :level, :team, :vendor_id, pictures: [])
    end

    def sort_column
      %w{ store_id team priority user_id assigned }.include?(params[:sort]) ? params[:sort] : "store_id"
    end

    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end

    def workorder_list
      if current_user.position.department == 'Operations'
        Workorder.where(store_id: current_user.stores.ids, status: 'Open').order(store_id: 'ASC', id: 'ASC').includes(:workorder_updates, :user)
      else
        Workorder.where(status: 'Open').order(store_id: 'ASC', id: 'ASC').includes(:workorder_updates, :user)
      end
    end
end
