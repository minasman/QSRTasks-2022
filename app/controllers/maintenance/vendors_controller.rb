class Maintenance::VendorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vendor, only: %i[ show edit update destroy ]

  # GET /vendors or /vendors.json
  def index
    @vendors = Vendor.where(organization: current_user.organization).order(name: :asc)
    @vendors = @vendors.search(params[:query]) if params[:query].present?
    @pagy, @vendors = pagy @vendors.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
    authorize Vendor
  end

  # GET /vendors/1 or /vendors/1.json
  def show
    authorize @vendor
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
    authorize @vendor
  end

  # GET /vendors/1/edit
  def edit
    authorize @vendor
  end

  # POST /vendors or /vendors.json
  def create
    @vendor = Vendor.new(vendor_params)
    authorize @vendor
    @vendor.organization = current_user.organization
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to vendor_url(@vendor), notice: "Vendor was successfully created." }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1 or /vendors/1.json
  def update
    authorize @vendor
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to vendor_url(@vendor), notice: "Vendor was successfully updated." }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1 or /vendors/1.json
  def destroy
    authorize @vendor
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to vendors_url, notice: "Vendor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_params
      params.require(:vendor).permit(:name, :email, :phone, :contact, :organization_id)
    end

    def sort_column
      %w{ name}.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end
end
