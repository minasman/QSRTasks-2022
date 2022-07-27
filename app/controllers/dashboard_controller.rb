class DashboardController < ApplicationController
  before_action :authenticate_admin!, only: %i[admin_dashboard]
  before_action :authenticate_user!, only: %i[dashboard]

  def dashboard
    @rewarded = flow
  end

  def admin_dashboard; end

  private

  def reward_list
    User.where(active: true, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
  end

  private

    def flow
      department = current_user.position.department
      position = current_user.position.name
      if department == "Operations"
        flow_list = []
        if position == "Crew" || position == "Manager"
          flow_list = []
        elsif position == "General Manager"
          flow_list = current_user.stores[0].users.where(active: true, position_id: Position.where(name: ["Crew", "Manager"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        elsif position == "Supervisor"
          current_user.stores.each do |store|
            flow_list.push(store.users.where(active: true, position_id: Position.where(name: ["General Manager","Crew", "Manager"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: []))
          end
          flow_list.flatten.uniq
        else
          current_user.stores.each do |store|
            flow_list.push(store.users.where(active: true, position_id: Position.where(name: ["Supervisor", "General Manager","Crew", "Manager"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: []))
          end
          flow_list.flatten.uniq
        end
      elsif department == "Maintenance"
        if position.in? ["Maint Admin", "AA", "Maint Tech", "OTP Tech", "Patch Maint"]
          flow_list = []
        elsif position == "PM Department Head"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Patch Maint"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        elsif position == "Maint Tech Department Head"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Maint Tech"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        elsif position == "Technology Department Head"
          flow_list = User.where(active: true, position_id: Position.where(name: ["OTP Tech"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        else
          flow_list = User.where(active: true, position_id: Position.where(name: ["Technology Department Head", "Maint Tech Department Head", "PM Department Head", "Patch Maint", "OTP Tech", "Maint Tech", "AA", "Maint Admin"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        end
      elsif department == "Office"
        if position.in? ["HR Admin", "Payroll Admin", "AP Admin", "Shopper", "AR Admin", "Marketing Admin"]
          flow_list = []
        elsif position == "HR Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["HR Admin"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        elsif position == "AP Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["AP Admin"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        elsif position == "AR Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["AR Admin"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        elsif position == "Marketing Manager"
          flow_list = User.where(active: true, position_id: Position.where(name: ["Marketing Admin"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        else
          flow_list = User.where(active: true, position_id: Position.where(name: ["Payroll Admin"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
        end
      else
        flow_list = User.where(active: true, position_id: Position.where(name: ["Operations Manager", "Supervisor", "General Manager", "Manager", "Crew", "HR Manager", "Payroll Manager", "Training Manager", "AR Manager", "AP Manager", "Marketing Manager", "HR Admin", "Payroll Admin", "Training Assistant", "AR Admin", "AP Admin", "Marketing Admin", "Maint Department Head", "PM Department Head", "Maint Tech Department Head", "Technology Department Head", "OTP Tech", "PM Maint", "Maint Tech", "AA", "Maint Admin", "Shopper"]).ids, organization_id: current_user.organization.id).where.not(redeemed_rewards: [])
      end
    end
end
