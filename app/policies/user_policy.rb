class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "HR Office Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "AA", "Office Admin", "Shopper"]
  end

  def show?
    index?
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "HR Manager", "Training Manager", "HR Admin", "Payroll Manager", "Payroll Admin", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
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
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "HR Manager", "Training Manager", "HR Admin", "Payroll Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
  end

end
