class Ability
  include CanCan::Ability

  def initialize(user)
    # Logged Out, everyone can do
    can :read, Event
    return unless user.present?
    can [:index, :show], Announcement
    can :overview, PagesController
    return unless user.member?
    # If User is at least a Member
    can :view_list, Participant
    can [:create, :destroy], Participant, user_id: user.id

    can [:index, :update, :sign_in_sheet], Participant do |participant|
      participant.event.user == user
    end
    
    return unless user.admin?
    # If User is at least an Admin
    can :manage, :all
  end
end
