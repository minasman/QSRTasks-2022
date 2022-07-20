class Training::TclassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: %i[ edit update destroy ]

  # GET /tclasses or /tclasses.json
  def index
    @tclasses = Tclass.all
  end

  # GET /tclasses/1 or /tclasses/1.json
  def show
    @tclass = Tclass.find(params[:id])
  end

  # GET /tclasses/new
  def new
    @student = User.find(params[:id])
  end

  # GET /tclasses/1/edit
  def edit
  end

  # POST /tclasses or /tclasses.json
  def create
    @tclass = Tclass.new(tclass_params)

    respond_to do |format|
      if @tclass.save
        format.html { redirect_to tclass_url(@tclass), notice: "Tclass was successfully created." }
        format.json { render :show, status: :created, location: @tclass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tclasses/1 or /tclasses/1.json
  def update
    respond_to do |format|
      if @tclass.update(tclass_params)
        format.html { redirect_to tclass_url(@tclass), notice: "Tclass was successfully updated." }
        format.json { render :show, status: :ok, location: @tclass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tclasses/1 or /tclasses/1.json
  def destroy
    @tclass.destroy

    respond_to do |format|
      format.html { redirect_to tclasses_url, notice: "Tclass was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tclass
      @student = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tclass_params
      params.require(:tclass).permit(:name, :duration, :capacity, :class_date, :class_time, :location, :curriculum_id, :expense)
    end
end
