class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    can :read, :all

    if user.admin?
      can :manage, :all
    else
      can :create, [Post, Comment]
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, user_id: user.id
    end
  end
end
