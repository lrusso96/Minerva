class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.id
      cannot :manage, :all
      can :read, :all
      can :manage, Paper, user_id: user.id
      can :manage, User, id: user.id
      can :manage, Issue, opener_id: user.id
      can :manage, Issue, paper: { user_id: user.id }
      can %i[create destroy], Comment, user_id: user.id
    end
  end
end
