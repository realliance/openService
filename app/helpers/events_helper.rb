module EventsHelper
  def user_select_list
    User.order('rank DESC').map{|u| [u.full_name + ' - ' + u.rank_name, u.id] }
  end

  def get_date_string(datetime)
    datetime.strftime('%b %-d')
  end

  def get_time_range(d1, d2)
    d1.strftime('%l:%M%P') + ' - ' + d2.strftime('%l:%M%P')
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

  def location_to_google_maps_search_link(location)
    'https://www.google.com/maps/search/' + location.tr(' ', '+')
  end
end
