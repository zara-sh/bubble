class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # keep comments below in case of misunderstood usage.
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def create? # anyone can create
    return true
  end

  def update? # creator can update
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy? # creator can destroy
    record.user == user
  end
end
