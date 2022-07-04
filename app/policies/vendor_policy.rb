class VendorPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Operations Manager", "Supervisor", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
  end

  def show?
    index?
  end

  def new?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
  end

  def create?
    new?
  end

  def edit?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
  end

  def update?
    edit?
  end

  def destroy?
    @user.position.name.in? ["Director", "Owner", "Business Director", "Maint Department Head", "Technology Department Head", "PM Department Head", "Maint Tech Department Head"]
  end

end
