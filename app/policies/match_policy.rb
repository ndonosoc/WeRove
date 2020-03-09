class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user
  end

  def show?
    user
  end

  def matchme?
    user
  end

  def home?
    user
  end

  def create?
    user
  end

  def update?
    user
  end
end
