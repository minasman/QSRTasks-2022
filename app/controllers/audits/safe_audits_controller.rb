class Audits::SafeAuditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_safe_audit, only: %i[ show edit update destroy ]

  # GET /safe_audits or /safe_audits.json
  def index
    @safe_audits = SafeAudit.all
    authorize SafeAudit
  end

  # GET /safe_audits/1 or /safe_audits/1.json
  def show
    authorize @safe_audit
  end

  # GET /safe_audits/new
  def new
    @safe_audit = SafeAudit.new
    authorize @safe_audit
  end

  # GET /safe_audits/1/edit
  def edit
    authorize @safe_audit
    if @safe_audit.auditor != current_user
      respond_to do |format|
        format.html { redirect_to safe_audit_url(@safe_audit), alert: "You cannot edit an audit you did not generate" }
      end
    end
  end

  # POST /safe_audits or /safe_audits.json
  def create
    @safe_audit = SafeAudit.new(safe_audit_params)
    authorize @safe_audit
    @safe_audit.auditor = current_user
    @safe_audit.organization = current_user.organization

    respond_to do |format|
      if @safe_audit.save
        AuditMailer.safe_audit(@safe_audit).deliver_later
        format.html { redirect_to safe_audit_path(@safe_audit), notice: "Safe audit was successfully created." }
        format.json { render :show, status: :created, location: @safe_audit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @safe_audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /safe_audits/1 or /safe_audits/1.json
  def update
    authorize @safe_audit
    respond_to do |format|
      if @safe_audit.update(safe_audit_params)
        format.html { redirect_to safe_audit_path(@safe_audit), notice: "Safe audit was successfully updated." }
        format.json { render :show, status: :ok, location: @safe_audit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @safe_audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safe_audits/1 or /safe_audits/1.json
  def destroy
    authorize @safe_audit
    @safe_audit.destroy

    respond_to do |format|
      format.html { redirect_to safe_audits_url, notice: "Safe audit was successfully destroyed." }
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
    def set_safe_audit
      @safe_audit = SafeAudit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def safe_audit_params
      params.require(:safe_audit).permit(:auditor_id, :store_id, :organization_id, :safe_audit_date, :safe_audit_time, :manager_id, :comment, :hundred, :fifty, :twenty, :ten, :five, :two, :one, :quarter, :dime, :nickel, :penny, :dollar_coin, :half_dollar, :misc_coin, :gift_certificate, :gift_certificate_redeemed, :receipt, :other, :coin_changer, :drawer, :drawer_amount, :working_headset, :non_working_headset, :total_headset, :other, :total_safe, :safe_variance, :shift_manager, :signature, :missing_headset, :ipad, :total_safe, :safe_variance)
    end
end
