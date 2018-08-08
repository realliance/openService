module PagesHelper
  def upcoming_events(user)
    user.participants.select { |participant| !participant.event.finished? }
  end
end
