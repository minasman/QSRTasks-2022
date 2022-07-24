class CovidStatusPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'HR Admin', 'Payroll Admin','Payroll Manager', 'Maint Admin', 'Marketing Manager', 'Training Manager', 'Operations Manager', 'Maint Department Head', 'PM Department Head',  'Technology Department Head', 'Maint Tech Department Head', 'Supervisor', 'General Manager', 'Manager']
  end

  def show?
    create?
  end

  def create?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'HR Admin', 'Payroll Admin','Payroll Manager', 'Maint Admin', 'Marketing Manager', 'Training Manager', 'Operations Manager', 'Maint Department Head', 'PM Department Head', 'Technology Department Head', 'Maint Tech Department Head', 'Supervisor', 'General Manager', 'Manager']
  end

  def new?
    create?
  end

  def update?
    new?
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
