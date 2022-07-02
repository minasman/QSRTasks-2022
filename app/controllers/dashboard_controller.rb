class DashboardController < ApplicationController
  before_action :authenticate_admin!, only: %i[admin_dashboard]
  before_action :authenticate_user!, only: %i[dashboard]

  def dashboard; end

  def admin_dashboard; end
end
