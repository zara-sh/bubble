class BookingPolicy < ApplicationPolicy
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

  def create? # anyone can create
    return true
  end

  def destroy? # creator can destroy
    record.user == user
  end
end
