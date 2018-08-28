module PagesHelper
  def upcoming_events(user)
    user.participants.select { |participant| participant.event.unfinished? }
  end
end
