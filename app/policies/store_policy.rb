class StorePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "Training Assistant", "HR Admin", "Payroll Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "Maint Admin"]
  end

  def show?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "Crew", "HR Manager", "Training Manager", "Training Assistant", "HR Admin", "Payroll Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "Maint Admin"]
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director"]
  end

  def create?
    new?
  end

  def edit?
    @user.position.name.in? ["Director", "Owner", "Business Director"]
  end

  def update?
    edit?
  end

  def destroy?
    @user.position.name.in? ["Director", "Owner", "Business Director"]
  end

end
