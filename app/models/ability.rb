class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.new_record?
      # user is not logged in
      # can :manage, :all
    else
      # user is logged in
      can [:create, :destroy], Authorization do |authorization|
        authorization.group.moderators.include?(user)
      end
    end
  end
end
