class AdminAbility
  include CanCan::Ability
  def initialize(user)
    return unless user && user.admin?
    can :access, :dashboard
  end
end