class DashboardController < ApplicationController
  before_action :authenticate_admin!, only: %i[admin_dashboard]
  before_action :authenticate_user!, only: %i[dashboard]

  def dashboard
    @rewarded = reward_list
  end

  def admin_dashboard; end

  private

  def reward_list
    User.where(active: true, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
  end
end
