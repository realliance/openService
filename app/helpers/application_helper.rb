module ApplicationHelper
  def devise_key_to_bootstrap_class(key)
    bootstrap_keys = {
      'error' => 'danger',
      'alert' => 'info',
      'success' => 'success',
      'notice' => 'primary'
    }
    bootstrap_keys[key]
  end

  def get_date_string(datetime)
    datetime.strftime('%b %-d')
  end

  def get_time_range(dt1, dt2)
    dt1.strftime('%l:%M%P') + ' - ' + dt2.strftime('%l:%M%P')
  end

  def location_to_google_maps_search_link(location)
    'https://www.google.com/maps/search/' + location.tr(' ', '+')
  end
end
