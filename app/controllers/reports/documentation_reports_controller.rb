class Reports::DocumentationReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_documentation_report, only: %i[ show edit update destroy ]

  # GET /documentation_reports or /documentation_reports.json
  def index
    level = reporting_level
    start_date = params[:searchData][:start_date]
    end_date = params[:searchData][:end_date]
    documentation_type = params[:type]
    @documentation_reports = Documentation.includes(:store).where(document_date: start_date..end_date).order(:store_id, :document_date)
    @documentation_reports = documentation_type == "all" ? @documentation_reports : @documentation_reports.where(documentation_type: documentation_type)

    case level
    when "all"
      @documentation_reports = @documentation_reports
    when "om"
      @documentation_reports = @documentation_reports.where(store_id: User.find(params[:searchData][:om_id]).stores.ids)
    when "sup"
      @documentation_reports = @documentation_reports.where(store_id: User.find(params[:searchData][:supervisor_id]).stores.ids)
    when "store"
      @documentation_reports = @documentation_reports.where(store_id: Store.find(params[:searchData][:store_id]).id)
    end

    @documentation_reports = @documentation_reports.search(params[:query]) if params[:query].present?
    @pagy, @documentation_reports = pagy @documentation_reports.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
  end

  # GET /documentation_reports/1 or /documentation_reports/1.json
  def show
  end

  # GET /documentation_reports/new
  def new
   @documentation_reports = []
  end

  # GET /documentation_reports/1/edit
  def edit
  end

  # POST /documentation_reports or /documentation_reports.json
  def create
    @documentation_report = DocumentationReport.new(documentation_report_params)

    respond_to do |format|
      format.html { redirect_to documentation_report_path(@documentation_report), notice: "Documentation report was successfully created." }
      format.json { render :show, status: :created, location: @documentation_report }
    end
  end

  # PATCH/PUT /documentation_reports/1 or /documentation_reports/1.json
  def update
    respond_to do |format|
      if @documentation_report.update(documentation_report_params)
        format.html { redirect_to documentation_report_path(@documentation_report), notice: "Documentation report was successfully updated." }
        format.json { render :show, status: :ok, location: @documentation_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @documentation_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentation_reports/1 or /documentation_reports/1.json
  def destroy
    @documentation_report.destroy

    respond_to do |format|
      format.html { redirect_to documentation_reports_url, notice: "Documentation report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

   def reporting_level
    if params[:organization] == 'true'
      'all'
    elsif !params[:searchData][:om_id].empty?
      'om'
    elsif !params[:searchData][:supervisor_id].empty?
      'sup'
    elsif !params[:searchData][:store_id].empty?
      'store'
    else
      render :new
    end
  end

  def sort_column
    %w{ store_id }.include?(params[:sort]) ? params[:sort] : "store_id"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
  end

end
