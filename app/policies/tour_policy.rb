class TourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    user.tours.any?
  end

  def update?
    record.provider == user
  end

  def destroy?
    record.provider == user
  end
end
