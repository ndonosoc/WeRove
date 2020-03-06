class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    !user.nil?
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
