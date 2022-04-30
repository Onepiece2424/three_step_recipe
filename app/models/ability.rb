# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :session
    user ||= User.new
    if user.general?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
