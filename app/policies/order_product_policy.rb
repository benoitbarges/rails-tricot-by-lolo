class OrderProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def destroy?
    return true
  end

  def add?
    return true
  end

  def reduce?
    return true
  end
end
