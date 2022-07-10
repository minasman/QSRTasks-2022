class Documentations::DocumentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_documentation, only: %i[ show edit update destroy ]

  # GET /documentations or /documentations.json
  def index
    @documentations = Documentation.all
  end

  # GET /documentations/1 or /documentations/1.json
  def show
  end

  # GET /documentations/new
  def new
    @documentation = Documentation.new
  end

  # GET /documentations/1/edit
  def edit
  end

  # POST /documentations or /documentations.json
  def create
    @documentation = Documentation.new(documentation_params)
    new_params = params.merge!(
      :organization_id => current_user.organization.id,
      :awarded_by_id => current_user.id,
      :position_id => User.find(params[:documentation][:employee_named_id]).position.id,
      :points => Document.find(params[:documentation][:document_id]).points
    )

    respond_to do |format|
      if @documentation.save
        format.html { redirect_to documentation_url(@documentation), notice: "Documentation was successfully created." }
        format.json { render :show, status: :created, location: @documentation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @documentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentations/1 or /documentations/1.json
  def update
    respond_to do |format|
      if @documentation.update(documentation_params)
        format.html { redirect_to documentation_url(@documentation), notice: "Documentation was successfully updated." }
        format.json { render :show, status: :ok, location: @documentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @documentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentations/1 or /documentations/1.json
  def destroy
    @documentation.destroy

    respond_to do |format|
      format.html { redirect_to documentations_url, notice: "Documentation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def employee_list
    @target = params[:target]
    store = Store.find(params[:store])
    users =  store.users
    if store.store_type == "OFFICE"
      @employees = User.where(position_id: Position.where(department: ["Administration", "Maintenance"])).or(User.where(position: Position.where(name: ["Supervisor", "Operations Manager"]))).order(position_id: :desc, first_name: :asc)
    else
      @employees = users.where(position_id: [5, 15, 26], active: true).order(position_id: :desc, first_name: :asc)
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  def level_list
    @target = params[:target]
    if params[:type] == "Documentation"
      @levels = Document::DOCUMENT_LEVEL_DOCUMENTATION
    else
      @levels = Document::DOCUMENT_LEVEL_COMMENDATION
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  def document_list
    @target = params[:target]
    @document_list = Document.where(documentation_type: params[:type], documentation_class: params[:klass], level: params[:level])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentation
      @documentation = Documentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documentation_params
      params.require(:documentation).permit(:organization_id, :store_id, :employee_named_id, :awarded_by_id, :position_id, :document_id, :documentation_type, :level, :documentation_class, :description, :points, :document_date, :individual, pictures: [])
    end

    def flow_of_accountability(document, new_params)
      named_employee = User.find(document.employee_named_id)
      department = document.position.department
      position = document.position.name
      if department == "Operations"
        if position == "Crew" || position == "Manager"
          flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["General Manager", "Supervisor", "Operations Manager", "Director"]).ids)
        elsif position == "General Manager"
          flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["Supervisor", "Operations Manager", "Director"]).ids)
        elsif position == "Supervisor"
          flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["Operations Manager", "Director"]).ids)
        else #Operations Manager
          flow_list = named_employee.stores[0].users.where(position_id: Position.where(name: ["Director"]).ids)
        end

      elsif department == "Maintenance"
        if position == "Maint Admin"
          flow_list = User.where(position_id: Position.where(name: ["Maint Department Head"]).ids)
        elsif position == "AA"
          flow_list = User.where(position_id: Position.where(name: ["Maint Department Head"]).ids)
        elsif position == "Maint Tech"
          flow_list = User.where(position_id: Position.where(name: ["Maint Tech Department Head", "Maint Department Head"]).ids)
        elsif position == "OTP Tech"
          flow_list = User.where(position_id: Position.where(name: ["Technology Department Head", "Maint Department Head"]).ids)
        elsif position == "Patch Maint"
          flow_list = User.where(position_id: Position.where(name: ["PM Department Head", "Maint Department Head"]).ids)
        elsif position == "PM Department Head"
          flow_list = User.where(position_id: Position.where(name: ["Maint Department Head"]).ids)
        elsif position == "Maint Tech Department Head"
          flow_list = User.where(position_id: Position.where(name: ["Maint Department Head"]).ids)
        elsif position == "Technology Department Head"
          flow_list = User.where(position_id: Position.where(name: ["Maint Department Head"]).ids)
        else # Maint Department Head (Need logic to not duplicate when DM is doc)
          flow_list = User.where(position_id: Position.where(name: [""]).ids)
        end

      else
        if position == "HR Office Admin"
          flow_list = User.where(position_id: Position.where(name: ["HR Manager", "Business Director"]).ids)
        elsif position == "HR Manager"
          flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "Payroll Office Admin"
          flow_list = User.where(position_id: Position.where(name: ["Payroll Manager", "Business Director"]).ids)
        elsif position == "Shopper"
          flow_list = User.where(position_id: Position.where(name: ["Maint Department Head"]).ids)
        elsif position == "AP Office Admin"
          flow_list = User.where(position_id: Position.where(name: ["AP Manager", "Business Director"]).ids)
        elsif position == "AR Office Admin"
          flow_list = User.where(position_id: Position.where(name: ["AR Manager", "Business Director"]).ids)
        elsif position == "Marketing Office Admin"
          flow_list = User.where(position_id: Position.where(name: ["Marketing Manager", "Business Director"]).ids)
        elsif position == "AP Manager"
          flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "AR Manager"
          flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "Marketing Manager"
          flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "Payroll Manager"
          flow_list = User.where(position_id: Position.where(name: ["Business Director"]).ids)
        else #Business Director
          flow_list = User.where(position_id: Position.where(name: [""]).ids)
        end
      end
      flow_list.each do |employee|
        flow_document = Document.new(new_params)
        flow_document.employee_named = employee
        flow_document.position = employee.position
        flow_document.description = "Initial Named Employee: #{document.employee_named.full_name} at #{document.store.number}: #{document.description}"
        flow_document.save
      end
    end
end
