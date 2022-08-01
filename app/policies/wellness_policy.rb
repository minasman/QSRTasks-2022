class WellnessPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Owner", "Director", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Payroll Manager", "Training Manager", "AR Manager", "AP Manager", "Marketing Manager", "HR Admin", "Payroll Admin", "Training Assistant", "AR Admin", "AP Admin", "Marketing Admin", "Maint Department Head", "PM Department Head", "Maint Tech Department Head", "Technology Department Head", "OTP Tech", "PM Maint", "Maint Tech", "AA", "Maint Admin", "Shopper"
    ]
  end

  def new?
    @user.position.name.in? ["Owner", "Director", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Payroll Manager", "Training Manager", "AR Manager", "AP Manager", "Marketing Manager", "HR Admin", "Payroll Admin", "Training Assistant", "AR Admin", "AP Admin", "Marketing Admin", "Maint Department Head", "PM Department Head", "Maint Tech Department Head", "Technology Department Head", "OTP Tech", "PM Maint", "Maint Tech", "AA", "Maint Admin", "Shopper"
    ]
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
