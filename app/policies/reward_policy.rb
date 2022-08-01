class RewardPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "HR Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "AA", "Office Admin", "Shopper", "Payroll Admin", "AR Admin", "AP Admin", "Training Assistant", "Marketing Admin"]
  end

  def show?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "HR Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "AA", "Office Admin", "Shopper", "Payroll Admin", "AR Admin", "AP Admin", "Training Assistant", "Marketing Admin", "Crew", "Patch Maint", "Maint Tech", "OTP Tech"]
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager"]
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    edit?
  end

  def destroy?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager"]
  end
end
