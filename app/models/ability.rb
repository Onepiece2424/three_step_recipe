# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :session
    user ||= User.new
    if user.guest?
      can :read, :all
    else
      can :manage, :all
    end
  end
end
