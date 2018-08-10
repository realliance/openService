class PagesController < ApplicationController
  skip_authorization_check

  def root
    if user_signed_in?
      render file: 'pages/dashboard'
    else
      redirect_to new_user_session_path
    end
  end
end
