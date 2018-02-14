class Admin::UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
