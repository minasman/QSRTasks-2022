class WorkorderPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'Maint Department Head', 'Maint Tech Department Head', 'PM Department Head', 'Technology Department Head', 'Operations Manager', 'Supervisor', 'General Manager', 'AA', 'Maint Admin', 'Maint Tech', 'OTP Tech', 'Patch Maint', 'Training Manager', 'HR Admin']
  end

  def new?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'Maint Department Head', 'Maint Tech Department Head', 'PM Department Head', 'Technology Department Head', 'Operations Manager', 'Supervisor', 'General Manager', 'AA', 'Maint Admin', 'Maint Tech', 'OTP Tech', 'Patch Maint', 'Training Manager', 'HR Admin']
  end

  def create?
    new?
  end

  def edit?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'Maint Department Head', 'Maint Tech Department Head', 'PM Department Head', 'Technology Department Head', 'Maint Admin', "Patch Maint", "OTP Tech", "Maint Tech", "AA"]
  end

  def update?
    edit?
  end

  def destroy?
    @user.position.name == 'Director'
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
