# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, User
    else
      can [:index, :show], User
    end
  end
end
