class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # keep comments below in case of misunderstood usage.
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def index?
    return true
  end

  def the_calender?
    return true
  end
end
