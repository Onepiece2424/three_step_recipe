# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # role が admin のユーザーはモデルの操作を行うことができて管理者画面を閲覧可能
    if user.has_attribute?(:admin)
      can :manage, :all
      can :access_admin_page, :all

    # role が read_only のユーザーはモデルの操作を行うことができず閲覧のみ可能、管理者画面は閲覧不可能
    elsif user.has_attribute?(:read_only)
      can :read, :all
      cannot :access_admin_page, :all

    # role を持っていないユーザーは全ての画面が閲覧不可能
    else
      can :manage, :all
    end
  end
end
