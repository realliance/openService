class Ability
  include CanCan::Ability

  def initialize(user)
    # Logged Out, everyone can do
    can :read, Event
    return unless user.present?
    can [:index, :show], Announcement
    return unless user.member?
    # If User is at least a Member
    can :view_list, Participant
    can [:create, :destroy], Participant, user_id: user.id
    
    return unless user.admin?
    # If User is at least an Admin
    can [:index, :create, :destroy], Participant
    can :manage, Event
    can :manage, Setting
    can :manage, User
    can :manage, Announcement
  end
end
