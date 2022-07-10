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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentation
      @documentation = Documentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documentation_params
      params.require(:documentation).permit(:organization_id, :store_id, :employee_named_id, :awarded_by_id, :position_id, :document_id, :documentation_type, :level, :documentation_class, :description, :points, :document_date, :individiual, :document_description)
    end
end
