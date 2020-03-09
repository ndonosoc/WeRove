class RatingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user
  end

  def new?
    user
  end

  def create?
    user
  end
end
