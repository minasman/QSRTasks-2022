class CommentUpdatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "General Manager", "Manager", "Crew", "HR Manager", "Training Manager", "HR Admin", "Payroll Manager", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head", "AA", "Payroll Admin", "Shopper"]
  end

  def show?
    index?
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin", "Supervisor", "Payroll Admin", "AR Admin", "AP Admin", "Marketing Admin"]
  end

  def create?
    new?
  end

  def edit?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin"]
  end

  def update?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin", "Operations Manager", "Supervisor"]
  end

  def destroy?
    @user.position.name.in? ["Director", "Owner", "Business Director", "HR Manager", "HR Admin"]
  end

end
