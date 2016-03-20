class Ability
  include CanCan::Ability


  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, :to => :crud

    # all role methods are defined User model
    # ["guest", "common_user", "merchant", "bbs_admin", "admin", "supper_admin"]
    if user.supper_admin?
      can :manage, :all
    elsif user.bbs_admin?
      can :read, :all
      can :index_all, Food
      can :crud, [Post, Comment]
      can [:top, :elite], [Post]
    elsif user.common_user?
      can :read, :all
      can [:create, :pictures], [Post, Comment]

      can [:update], Post do |post|
        !post.user_id.nil? and post.user_id == user.id
      end
      can [:update, :destroy], Comment do |post|
        !post.user_id.nil? and post.user_id == user.id
      end

      can :create, ShopRemark
      can :destroy, ShopRemark do |remark|
        !remark.user_id.nil? and remark.user_id == user.id
      end

      can [:create, :uppics], Shop
      can [:owner, :update, :upload_picture, :face], Shop do |shop|
        !shop.user_id.nil? and shop.user_id == user.id
      end

      can [:create, :index_all], Food
      can [:update, :destroy], Food do |food|
        !food.user_id.nil? and food.user_id == user.id
      end

      can :create, Picture
      can [:update, :destroy], Picture do |pic|
        !pic.user_id.nil? and pic.user_id == user.id
      end

    else
      can :read, :all
      can :index_all, Food
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
