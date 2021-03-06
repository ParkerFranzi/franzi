class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.role? :guest
    end

    if user.role? :member
      can :manage, Post, :user_id => user.id
      can :manage, Comment, :user_id => user.id
      can :manage, Gallery, :user_id => user.id
      can :manage, Picture, :user_id => user.id
      can :read, :all
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

  end
end
