class WorkorderUpdatePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user.position.name.in? ['Owner', 'Director', 'Business Director', 'HR Manager', 'Maint Department Head', 'Maint Tech Department Head', 'PM Department Head', 'Technology Department Head', 'Operations Manager', 'Supervisor', 'Gerneral Manager', 'AA', 'Maint Admin', 'Maint Tech', 'OTP Tech', 'Patch Maint', 'Training Manager', "Marketing Manager"]
  end

  def create?
    new?
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
