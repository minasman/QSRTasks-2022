class MocsController < ApplicationController
  before_action :set_moc, only: %i[ show edit update destroy ]

  # GET /mocs or /mocs.json
  def index
    @mocs = Moc.all
  end

  # GET /mocs/1 or /mocs/1.json
  def show
  end

  # GET /mocs/new
  def new
    @moc = Moc.new
  end

  # GET /mocs/1/edit
  def edit
  end

  # POST /mocs or /mocs.json
  def create
    @moc = Moc.new(moc_params)

    respond_to do |format|
      if @moc.save
        format.html { redirect_to moc_url(@moc), notice: "Moc was successfully created." }
        format.json { render :show, status: :created, location: @moc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mocs/1 or /mocs/1.json
  def update
    respond_to do |format|
      if @moc.update(moc_params)
        format.html { redirect_to moc_url(@moc), notice: "Moc was successfully updated." }
        format.json { render :show, status: :ok, location: @moc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mocs/1 or /mocs/1.json
  def destroy
    @moc.destroy

    respond_to do |format|
      format.html { redirect_to mocs_url, notice: "Moc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moc
      @moc = Moc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moc_params
      params.require(:moc).permit(:organization_id, :store_id, :moc_date, :moc_time, :ops_score, :service_score, :quality_score, :cleanliness_score, :verified, :dt_target_1, :dt_target_2, :dt_target_3, :dt_actual_1, :dt_actual_2, :dt_actual_3, :dt_oepe_target_1, :dt_oepe_target_2, :dt_oepe_target_3, :dt_oepe_actual_1, :dt_oepe_actual_2, :dt_oepe_actual_3, :di_guest_target_1, :di_guest_target_2, :di_guest_target_3, :di_guest_actual_1, :di_guest_actual_2, :di_guest_actual_3, :di_time_target_1, :di_time_target_2, :di_time_target_3, :di_time_actual_1, :di_time_actual_2, :di_time_actual_3, :add_target_1, :add_target_2, :add_target_3, :add_target_4, :add_target_5, :add_target_6, :add_actual_1, :add_actual_2, :add_actual_3, :add_actual_4, :add_actual_5, :add_actual_6, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :q11, :q12, :q13, :q14, :q15, :q16, :q17, :q18, :q19, :q20, :q21, :q22, :q23, :q24, :q25, :q26, :q27, :q28, :q29, :q30, :q31, :q32, :q33, :q34, :q35, :q36, :q37, :q38, :q39, :q40, :q41, :q42, :q43, :q44, :q45, :q46, :q47, :q48, :q49, :q50, :q51, :q52, :q53, :q54, :q55, :q56, :q57, :q58, :q59, :q60, :q61, :q61, :q62, :q63, :q64, :opsTotal, :qualityTotal, :serviceTotal, :cleanlinessTotal, :veryGoodComments, :morePracticeComments, :preshiftSuccess, :duringShiftSuccess, :postShiftSuccess, :slSignature, :coachSignature)
    end
end
