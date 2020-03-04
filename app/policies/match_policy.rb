class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def matchme?
    true
  end

  def home?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
