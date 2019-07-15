class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
   current_user.admin?
  end

  def destroy?
    current_user.admin?
  end
end
