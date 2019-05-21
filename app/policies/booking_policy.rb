class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    record.tour.provider == user
  end

  def destroy?
    record.tour.provider == user
  end
end
