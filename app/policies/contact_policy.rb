class ContactPolicy < ApplicationPolicy
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

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end
end
