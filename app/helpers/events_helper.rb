module EventsHelper
  def user_select_list
    User.order(rank: :desc, first_name: :desc).map{|u| [u.full_name + ' - ' + u.rank_name, u.id] }
  end

  def format_datetime(datetime)
    datetime.strftime('%A, %b %e, %Y %l:%M%P')
  end

  def current_user_in_event(event)
    event.participants.find_by(user_id: current_user.id)
  end

  def get_slots_remaining(event)
    event.participant_slots - event.participants.count
  end
end
