module EventsHelper
  def user_select_list
    User.order('rank DESC').map{|u| [u.full_name + ' - ' + u.rank_name, u.id] }
  end
end
