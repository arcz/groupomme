class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.new_record?
      # user is not logged in
    else
      # user is logged in
      can :manage, Group do |group|
        group.moderators.include?(user)
      end
      can :post, Group do |group|
        group.users.include?(user)
      end
      can :comment, Post do |post|
        post.group.users.include?(user)
      end
    end
  end
end
