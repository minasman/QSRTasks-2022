class OrganizaitonsController < ApplicationController
  before_action :set_organizaiton, only: %i[ show edit update destroy ]

  # GET /organizaitons or /organizaitons.json
  def index
    @organizaitons = Organizaiton.all
  end

  # GET /organizaitons/1 or /organizaitons/1.json
  def show
  end

  # GET /organizaitons/new
  def new
    @organizaiton = Organizaiton.new
  end

  # GET /organizaitons/1/edit
  def edit
  end

  # POST /organizaitons or /organizaitons.json
  def create
    @organizaiton = Organizaiton.new(organizaiton_params)

    respond_to do |format|
      if @organizaiton.save
        format.html { redirect_to organizaiton_url(@organizaiton), notice: "Organizaiton was successfully created." }
        format.json { render :show, status: :created, location: @organizaiton }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organizaiton.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizaitons/1 or /organizaitons/1.json
  def update
    respond_to do |format|
      if @organizaiton.update(organizaiton_params)
        format.html { redirect_to organizaiton_url(@organizaiton), notice: "Organizaiton was successfully updated." }
        format.json { render :show, status: :ok, location: @organizaiton }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organizaiton.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizaitons/1 or /organizaitons/1.json
  def destroy
    @organizaiton.destroy

    respond_to do |format|
      format.html { redirect_to organizaitons_url, notice: "Organizaiton was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizaiton
      @organizaiton = Organizaiton.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organizaiton_params
      params.require(:organizaiton).permit(:name, :phone, :city, :state, :zip, :street)
    end
end
