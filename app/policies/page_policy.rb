class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
    true
  end

  def index?
    true
  end
end
