class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "Training Assistant", "HR Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "AA", "Payroll Admin", "Shopper"]
  end

  def show?
    index?
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "HR Manager", "Training Manager", "Training Assistant", "HR Admin", "Payroll Manager", "Payroll Admin", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    true
  end

  def destroy?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "HR Manager", "Training Manager", "Training Assistant", "HR Admin", "Payroll Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
  end

end
