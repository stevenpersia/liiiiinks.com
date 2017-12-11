class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all  # start by defining rules for all users, also not logged ones
    return unless user.present?
    can :create, Link
    #return unless user.admin?
    #can :manage, :all # finally we give all remaining permissions only to the admins
  end
end
