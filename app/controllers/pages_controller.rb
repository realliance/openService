class PagesController < ApplicationController
  skip_authorization_check
  authorize_resource only: :overview, class: PagesController

  def root
    if user_signed_in?
      render file: 'pages/dashboard'
    else
      redirect_to new_user_session_path
    end
  end

  def overview
    @participations = current_user.participants
    @total_possible_hours = 0
    @participations.each do |p|
      @total_possible_hours += p.event.total_hours
    end
    respond_with @participations
  end
end
