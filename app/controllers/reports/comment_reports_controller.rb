class Reports::CommentReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    level = reporting_level

    start_date = params[:searchData][:start_date]
    end_date = params[:searchData][:end_date]
    comment_type = params[:type]
    comment_source = params[:source]
    comment_status = params[:status]

    @comment_reports = Comment.includes(:store).where(visit_date: start_date..end_date).order(:store_id, :visit_date).includes(:guest)

    @comment_reports = comment_status == 'All' ? @comment_reports : @comment_reports.where(status: comment_status)
    @comment_reports = comment_source == 'All' ? @comment_reports : @comment_reports.where(source: comment_source)
    @comment_reports = comment_type == 'All' ? @comment_reports : @comment_reports.where(comment_type: comment_type)

    if level == 'all'
      @comment_reports
    elsif level == 'store'
      @comment_reports = @comment_reports.select { |c| c.store.id == (Store.find(params[:searchData][:store_id]).id) }
    else
      @comment_reports = @comment_reports.select { |c| c.store.users.ids.include?(User.find(level).id) }
    end
  end

  def new
    @comment_reports = []
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
end
