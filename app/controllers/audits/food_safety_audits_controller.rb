class Audits::FoodSafetyAuditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_safety_audit, only: %i[ show edit update destroy ]

  # GET /food_safety_audits or /food_safety_audits.json
  def index
    @food_safety_audits = FoodSafetyAudit.where(store_id: current_user.stores).order(shop_date: :asc)
    authorize FoodSafetyAudit
  end

  # GET /food_safety_audits/1 or /food_safety_audits/1.json
  def show
    authorize @food_safety_audit
  end

  # GET /food_safety_audits/new
  def new
    @food_safety_audit = FoodSafetyAudit.new
    authorize @food_safety_audit
  end

  # GET /food_safety_audits/1/edit
  def edit
    authorize @food_safety_audit
    if @food_safety_audit.auditor != current_user
      respond_to do |format|
        format.html { redirect_to food_safety_audit_url(@food_safety_audit), alert: "You cannot edit an audit you did not generate" }
      end
    end
  end

  # POST /food_safety_audits or /food_safety_audits.json
  def create
    @food_safety_audit = FoodSafetyAudit.new(food_safety_audit_params)
    authorize @food_safety_audit
    @food_safety_audit.organization = current_user.organization
    @food_safety_audit.auditor = current_user

    respond_to do |format|
      if @food_safety_audit.save
        AuditMailer.food_safety_audit(@food_safety_audit).deliver_later
        format.html { redirect_to food_safety_audit_url(@food_safety_audit), notice: "Food safety audit was successfully created." }
        format.json { render :show, status: :created, location: @food_safety_audit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_safety_audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_safety_audits/1 or /food_safety_audits/1.json
  def update
    authorize @food_safety_audit
    respond_to do |format|
      if @food_safety_audit.update(food_safety_audit_params)
        format.html { redirect_to food_safety_audit_url(@food_safety_audit), notice: "Food safety audit was successfully updated." }
        format.json { render :show, status: :ok, location: @food_safety_audit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_safety_audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_safety_audits/1 or /food_safety_audits/1.json
  def destroy
    authorize @food_safety_audit
    @food_safety_audit.destroy

    respond_to do |format|
      format.html { redirect_to food_safety_audits_url, notice: "Food safety audit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def manager_list
    @target = params[:target]
    store = Store.find(params[:store])
    @managers =  store.users.where(position_id: [5, 15], active: true).order(position_id: :desc, first_name: :asc)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_safety_audit
      @food_safety_audit = FoodSafetyAudit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_safety_audit_params
      params.require(:food_safety_audit).permit(:fs1_us, :fs2_us, :fs3_us, :fs4_us, :fs5_us, :fs6_us, :fs7_us, :fs8_us, :fs9_us, :fs10_us, :fs11_us, :fs12_us, :fs13_us, :fs14_us, :fs15_us, :fs16_us, :fs17_us, :fs18_us, :fs19_us, :fs19_us_01, :fs20_us, :fs21_us, :fs22_us, :fs23_us, :fs24_us, :fs25_us, :fs26_us, :fs26_us_01, :fs27_us, :fs28_us, :fs29_us, :fs30_us, :fs31_us, :fs32_us, :fs33_us, :store_id, :organization_id, :score, :shop_date, :shop_time, :critical, :auditor_id, :manager_id)
    end
end
