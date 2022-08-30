class DogPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

  end

  def show?
    true
    # is_user_or_admin?
  end

  def create?
    true
    # is_user_or_admin?
  end

  def update?
    true
    # is_user_or_admin?
  end

  def destroy?
    true
    # is_user_or_admin?
  end

  private

  def is_user_or_admin?
    record.user == user || user&.admin
  end
end
