class FoodHandlerCardPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "HR Manager", "Training Manager", "Training Assistant", "HR Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "AA", "Office Admin", "Payroll Admin", "AR Admin", "AP Admin", "Marketing Admin"]
  end

  def show?
    index?
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin", "Payroll Admin", "AR Admin", "AP Admin", "Marketing Admin", "General Manager", "Operations Manager", "Supervisor", "Manager", "Training Manager", "Training Assistant"]
  end

  def create?
    new?
  end

  def edit?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin", "Payroll Admin", "AR Admin", "AP Admin", "Marketing Admin", "General Manager", "Operations Manager", "Supervisor", "Manager", "Training Manager", "Training Assistant"]
  end

  def update?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin", "Payroll Admin", "AR Admin", "AP Admin", "Marketing Admin", "General Manager", "Operations Manager", "Supervisor", "Manager", "Training Manager", "Training Assistant"]
  end

  def destroy?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin", "Payroll Admin", "AR Admin", "AP Admin", "Marketing Admin", "General Manager", "Operations Manager", "Supervisor", "Training Manager", "Training Assistant"]
  end
end
