class CovidStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_covid_status, only: %i[ show edit update destroy ]

  # GET /covid_statuses or /covid_statuses.json
  def index
    @covid_statuses = users_access_list
    authorize CovidStatus
  end

  # GET /covid_statuses/1 or /covid_statuses/1.json
  def show
    authorize @covid_status
  end

  # GET /covid_statuses/new
  def new
    @covid_status = CovidStatus.new
    authorize @covid_status
  end

  # GET /covid_statuses/1/edit
  def edit
    authorize @covid_status
  end

  # POST /covid_statuses or /covid_statuses.json
  def create
    @covid_status = CovidStatus.new(covid_status_params)
    authorize @covid_status
    @covid_status.user = current_user
    @covid_status.organization = current_user.organization
    @covid_status.status = params[:status]
    respond_to do |format|
      if @covid_status.save
        if @covid_status.status == 'Fully Vaccinated'
          CovidMailer.fully(@covid_status).deliver_later
        end
        format.html { redirect_to covid_status_url(@covid_status), notice: "Covid status was successfully created for #{@covid_status.full_name}." }
        format.json { render :show, status: :created, location: @covid_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @covid_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covid_statuses/1 or /covid_statuses/1.json
  def update
    authorize @covid_status
    respond_to do |format|
      @covid_status.user = current_user
      @covid_status.status = params[:status]
      if @covid_status.update(covid_status_params)
        if @covid_status.status == 'Fully Vaccinated'
          CovidMailer.fully(@covid_status).deliver_later
        end
        format.html { redirect_to covid_status_url(@covid_status), notice: "Covid status was successfully updated." }
        format.json { render :show, status: :ok, location: @covid_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @covid_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covid_statuses/1 or /covid_statuses/1.json
  def destroy
    authorize @covid_status
    @covid_status.destroy
    respond_to do |format|
      format.html { redirect_to covid_statuses_url, notice: "Covid status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_covid_status
      @covid_status = CovidStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def covid_status_params
      params.require(:covid_status).permit(:organization_id, :first_name, :last_name, :store_id, :status, :user_id, :timecard, pictures: [])
    end

    def users_access_list
      case current_user.position.name
      when *['Owner', 'Director', 'Business Director', 'HR Manager', 'Training Manager', 'Training Assistant', 'Marketing Manager', 'HR Admin', 'Payroll Admin']
        @covid_statuses = CovidStatus.where(status: ["Not Vaccinated", "Partially Vaccinated", "Unknown"]).all.order(store_id: 'ASC', first_name: 'ASC')
      when *['Operations Manager', 'Supervisor', 'General Manager', 'Manager']
        @covid_statuses = CovidStatus.where(store_id: current_user.stores.ids, status: ["Not Vaccinated", "Partially Vaccinated", "Unknown"]).order(store_id: 'ASC', first_name: 'ASC')
      when *[ 'Maint Department Head', 'PM Department Head',  'Technology Department Head', 'Maint Tech Department Head', 'Maint Admin']
        @covid_statuses = CovidStatus.where(store_id: 37, status: ["Not Vaccinated", "Partially Vaccinated", "Unknown"]).order(store_id: 'ASC', first_name: 'ASC')
      end
    end
end
