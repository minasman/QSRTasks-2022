class Documentations::DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: %i[ show edit update destroy ]

  # GET /documents or /documents.json
  def index
    @documents = Document.all
    @documents = @documents.search(params[:query]) if params[:query].present?
    @pagy, @documents = pagy @documents.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
    authorize Document
  end

  # GET /documents/1 or /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
    authorize @document
  end

  # GET /documents/1/edit
  def edit
    authorize @document
  end

  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params)
    authorize @document
    @document.organization = current_user.organization
    respond_to do |format|
      if @document.save
        format.html { redirect_to document_path(@document), notice: "Document was successfully created." }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    authorize @document
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to document_path(@document), notice: "Document was successfully updated." }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    authorize @document
    document_id = "document_#{@document.id}"
    @document.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(document_id) }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:organization_id, :documentation_type, :documentation_class, :level, :definition, :points)
    end

    def sort_column
      %w{ documentation_type }.include?(params[:sort]) ? params[:sort] : "documentation_type"
    end

    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end
end
