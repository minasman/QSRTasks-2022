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
    index?
  end

  def create?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'Maint Department Head', 'Maint Tech Department Head', 'PM Department Head', 'Technology Department Head', 'Operations Manager', 'Supervisor', 'Gerneral Manager', 'AA', 'Maint Admin', 'Maint Tech', 'OTP Tech', 'Patch Maint', 'Training Manager']
  end

  def new?
    create?
  end

  def update?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'Maint Department Head', 'Maint Tech Department Head', 'PM Department Head', 'Technology Department Head', 'Maint Admin']
  end

  def edit?
    update?
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
