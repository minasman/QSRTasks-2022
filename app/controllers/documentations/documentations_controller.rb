class Documentations::DocumentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_documentation, only: %i[ show edit update destroy ]

  # GET /documentations or /documentations.json
  def index
    @documentations = documentation_list
    @documentations = @documentations.search(params[:query]) if params[:query].present?
    @pagy, @documentations = pagy @documentations.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
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
    if @documentation.awarded_by != current_user
      respond_to do |format|
        format.html { redirect_to documentation_url(@documentation), alert: "You cannot edit documentation you did not generate" }
      end
    end
  end

  # POST /documentations or /documentations.json
  def create
    new_params = documentation_params.merge!(
      :organization_id => current_user.organization.id,
      :awarded_by_id => current_user.id,
      :position_id => User.find(params[:documentation][:employee_named_id]).position.id,
      :points => Document.find(params[:documentation][:document_id]).points
    )
    @documentation = Documentation.new(new_params)

    respond_to do |format|
      if @documentation.save
        if params[:documentation][:individual] == "0"
          flow_of_accountability(@documentation, new_params)
        end
        new_point_total = @documentation.employee_named.accumulated_points + @documentation.points
        #(new_point_total <= -10 ? -10 : new_point_total) This line below should limit the points from dropping below
        # -10. Remove or adjust this guardrail as needed.
        @documentation.employee_named.update(accumulated_points: (new_point_total <= -10 ? -10 : new_point_total))
        SendDocumentationSmsJob.perform_later(@documentation.employee_named, message_to_send(@documentation))
        DocumentationMailer.new_documentation(@documentation).deliver_later
        format.html { redirect_to new_documentation_path, notice: "Documentation was successfully created." }
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
        format.html { redirect_to documentation_path(@documentation), notice: "Documentation was successfully updated." }
        format.json { render :show, status: :ok, location: @documentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @documentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentations/1 or /documentations/1.json
  def destroy
    authorize @documentation
    documentation_id = "documentation_#{@documentation.id}"
    @documentation.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(documentation_id) }
    end
  end

  def employee_list
    @target = params[:target]
    store = Store.find(params[:store])
    users =  store.users
    if store.store_type == "OFFICE"
      @employees = User.where(active: true, position_id: Position.where(department: ["Office", "Administration", "Maintenance"]).ids).where.not(id: current_user.id).or(User.where(active: true, position: Position.where(name: ["Supervisor", "Operations Manager"]))).order(position_id: :desc, first_name: :asc)
    else
      @employees = users.where(position_id: [5, 15, 26], active: true).where.not(id: current_user.id).order(position_id: :desc, first_name: :asc)
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  def level_list
    @target = params[:target]
    if params[:type] == "Exception"
      @levels = Document::DOCUMENT_LEVEL_EXCEPTION
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
          flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["General Manager", "Supervisor", "Operations Manager", "Director"]).ids)
        elsif position == "General Manager"
          flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["Supervisor", "Operations Manager", "Director"]).ids)
        elsif position == "Supervisor"
          flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["Operations Manager", "Director"]).ids)
        else #Operations Manager
          flow_list = named_employee.stores[0].users.where(active: true, position_id: Position.where(name: ["Director"]).ids)
        end

      elsif department == "Maintenance"
        if position == "Maint Admin"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
        elsif position == "AA"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
        elsif position == "Maint Tech"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Tech Department Head", "Maint Department Head", "Business Director"]).ids)
        elsif position == "OTP Tech"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Technology Department Head", "Maint Department Head", "Business Director"]).ids)
        elsif position == "Patch Maint"
          flow_list = User.where(active: true, position_id: Position.where(name: ["PM Department Head", "Maint Department Head", "Business Director"]).ids)
        elsif position == "PM Department Head"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
        elsif position == "Maint Tech Department Head"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
        elsif position == "Technology Department Head"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head", "Business Director"]).ids)
        else
          flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
        end

      else
        if position == "HR Admin"
          flow_list = User.where(active: true, position_id: Position.where(name: ["HR Manager", "Business Director"]).ids)
        elsif position == "HR Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "Payroll Admin"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Payroll Manager", "Business Director"]).ids)
        elsif position == "Shopper"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Department Head"]).ids)
        elsif position == "AP Admin"
          flow_list = User.where(active: true, position_id: Position.where(name: ["AP Manager", "Business Director"]).ids)
        elsif position == "AR Admin"
          flow_list = User.where(active: true, position_id: Position.where(name: ["AR Manager", "Business Director"]).ids)
        elsif position == "Marketing Admin"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Marketing Manager", "Business Director"]).ids)
        elsif position == "AP Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "AR Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "Marketing Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
        elsif position == "Payroll Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Business Director"]).ids)
        else #Business Director
          flow_list = User.where(active: true, position_id: Position.where(name: [""]).ids)
        end
      end
      flow_list.each do |employee|
        CreateDocumentationJob.perform_later(employee, new_params, document)
      end
    end

    def documentation_list
      case current_user.position.department
      when "Administration"
        Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today)
      when "Maintenance"
        case current_user.position.name
        when "Technology Department Head"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["OTP Tech", "Technology Department Head"]).ids)
        when "PM Department Head"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["Patch Maint", "PM Department Head"]).ids)
        when "Maint Tech Department Head"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["Maint Tech", "Maint Tech Department Head"]).ids)
        when "Maint Department Head"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(department: "Maintenance").ids)
        else
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, employee_named_id: current_user.id)
        end
      when "Office"
        case current_user.position.name
        when "HR Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["HR Admin", "HR Manager"]).ids)
        when "Training Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["Training Manager", "Training Assistant"]).ids)
        when "Marketing Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["Marketing Admin", "Marketing Manager"]).ids)
        when "AR Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["AR Admin", "AR Manager"]).ids)
        when "AP Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["AP Admin", "AP Manager"]).ids)
        when "Payroll Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, position_id: Position.where(name: ["Payroll Admin", "Payroll Manager"]).ids)
        else
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, employee_named_id: current_user.id)
        end
      when "Operations"
        case current_user.position.name
        when "Crew"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, employee_named_id: current_user.id)
        when "Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, employee_named_id: current_user.id)
        when "General Manager"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, store_id: current_user.stores, position_id: Position.where(name: ["Crew", "Manager", "General Manager"]))
        when "Supervisor"
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, store_id: current_user.stores, position_id: Position.where(name: ["Crew", "Manager", "General Manager", "Supervisor"]))
        else
          Documentation.where(document_date: Date.today.beginning_of_quarter..Date.today, store_id: current_user.stores)
        end
      end
    end

    def sort_column
      %w{ employee_named_id }.include?(params[:sort]) ? params[:sort] : "employee_named_id"
    end

    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end

    def message_to_send(documentation)
      if documentation.documentation_type == "Commendation"
        "You have been recognized by #{documentation.awarded_by.full_name} on #{documentation.document_date.strftime("%m/%d/%y")}: #{documentation.description}"
      else
        "Your #{documentation.documentation_class} on #{documentation.document_date.strftime("%m/%d/%y")} was identified as an exception by #{documentation.awarded_by.full_name}. Details: #{documentation.description}"
      end
    end
end
