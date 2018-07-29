class ApplicationController < ActionController::Base
  respond_to :html

  protect_from_forgery with: :exception
  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do
    head :forbidden
  end
end
