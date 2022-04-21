# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :session
    user ||= User.new
    if user.has_attribute?(:admin)
      can :manage, :all
      can :access_admin_page, :all
    elsif user.has_attribute?(:general)
      can :manage, :all
      cannot :access_admin_page, :all
    else
      can :read, :all
      cannot :access_admin_page, :all
    end
  end
end
