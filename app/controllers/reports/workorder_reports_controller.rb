class Reports::WorkorderReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    level = reporting_level

    start_date = params[:searchData][:start_date]
    end_date = params[:searchData][:end_date]
    workorder_status = params[:status]
    @workorder_reports = Workorder.where(created_at: start_date...end_date).order('store_id ASC', 'created_at ASC').includes(:workorder_updates, :user)

    @workorder_reports = @workorder_reports.where(status: workorder_status) if workorder_status != 'All'

    area = params[:searchData][:area]
    team = params[:searchData][:team]
    tech = params[:searchData][:tech]
    priority = params[:searchData][:priority]
    vendor = params[:searchData][:vendor]
    submitted = params[:searchData][:submitted_by]

    @workorder_reports = @workorder_reports.where(team: team) unless team.empty?

    @workorder_reports = @workorder_reports.where(assigned: tech) unless tech.empty?

    @workorder_reports = @workorder_reports.where(level: priority) unless priority.empty?

    @workorder_reports = @workorder_reports.where(vendor_id: vendor) unless vendor.empty?

    @workorder_reports = @workorder_reports.where(user_id: submitted) unless submitted.empty?

    @workorder_reports = @workorder_reports.where(equipment_id: equip_area(area)) unless area.empty?
    if level == 'all'
      @workorder_reports
    elsif level == 'store'
      @workorder_reports = @workorder_reports.select { |c| c.store.id == (Store.find(params[:searchData][:store_id]).id) }
    else
      @workorder_reports = @workorder_reports.select { |c| c.store.users.ids.include?(level.to_i) }
    end
  end

  def new
    @workorder_reports = []
  end

  private

  def reporting_level
    if params[:organization] == 'true'
      'all'
    elsif !params[:searchData][:om_id].empty?
      params[:searchData][:om_id]
    elsif !params[:searchData][:supervisor_id].empty?
      params[:searchData][:supervisor_id]
    elsif !params[:searchData][:store_id].empty?
      'store'
    else
      render :new
    end
  end

  def equip_area(area)
    equipment_list = Equipment.where(equipment_area_id: area)
    equipment_list.map(&:id)
  end
end
