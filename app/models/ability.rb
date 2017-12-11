class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Link
    can :read, Category
    return unless user.present?
    can :create, Link
    can :manage, :all if user.role == "admin"

  end
end
