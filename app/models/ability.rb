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
    can :manage, :all
  end
end
