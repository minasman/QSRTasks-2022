class WellnessPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "HR Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "Payroll Admin", "AR Admin", "Training Assistant", "Marketing Manager", "Marketing Admin", "AR Manager", "AP Manager", "AP Admin", "Patch Maint", "OTP Tech", "Maint Tech", "Maint Admin"]
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "HR Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "Payroll Admin", "AR Admin", "Training Assistant", "Marketing Manager", "Marketing Admin", "AR Manager", "AP Manager", "AP Admin", "Patch Maint", "OTP Tech", "Maint Tech", "Maint Admin"]
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    false
  end

  def update?
    edit?
  end

  def destroy?
    false?
  end
end
