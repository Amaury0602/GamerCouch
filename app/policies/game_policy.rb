class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def right_choice?
    true
  end

  def game_alike?
    true
  end
  def tracking?
    true
  end
end
