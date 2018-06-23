class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    cannot :manage, Paper
    unless user.id.nil?
      can :manage, Paper, user_id: user.id
      can :manage, User, id: user.id
    end
    if user.id
      can :read, :all
    else
      cannot :manage, :all
    end
  end
end
