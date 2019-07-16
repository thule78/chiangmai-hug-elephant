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
   user.admin?
  end

  def destroy?
    user.admin?
  end
end
