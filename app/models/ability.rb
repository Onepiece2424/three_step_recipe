# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :session
    user ||= User.new
    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all
    elsif user
      can :manage, :all
    else
      cannot :access, :rails_admin
      cannot :manage, :dashboard
      can :read, :all
    end
  end
end
