class ReviewPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    false
  end

  def create?
    true
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
