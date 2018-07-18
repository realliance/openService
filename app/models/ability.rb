class Ability
  include CanCan::Ability

  def initialize(user)

    if user.present?
      can :manage, User, user_id: user.id
      if user.admin?
        can :manage, Setting
      end
    end
  end
end
