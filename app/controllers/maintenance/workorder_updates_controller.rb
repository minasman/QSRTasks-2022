class Maintenance::WorkorderUpdatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workorder, only: %i[new index create]

  # GET /workorder_updates/new
  def new
    @workorder.workorder_updates.build
    authorize @workorder
   end

  # PATCH/PUT /workorder_updates/1 or /workorder_updates/1.json
  def create
    authorize @workorder
    if params[:workorder_update][:signature].length > 0
      @workorder_update = @workorder.workorder_updates.create(workorder_params)
      @workorder_update.user = current_user
      flash.notice = 'Workorder Update Successfully Added'
      if params[:workorder_update][:status] && params[:workorder_update][:status] == '1'
        @workorder.status = 'Closed'
        @workorder_update.save
        @workorder.save
        WorkorderMailer.workorder_closed(@workorder).deliver_later
      else
        @workorder_update.save
        WorkorderMailer.workorder_update(@workorder).deliver_later
      end
      redirect_to workorder_path(@workorder)
    else
      respond_to do |format|
        flash.alert = 'Signature is Required'
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workorder
      @workorder = Workorder.find(params[:workorder_id])
    end
    # Only allow a list of trusted parameters through.
    def workorder_params
      params.require(:workorder_update).permit(:user_id, :workorder_id, :current_update, :manager, :signature, pictures:[])
    end
end
