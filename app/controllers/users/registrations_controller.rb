# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user[:rank] = User.count.zero? ? 4 : 0
      user[:deactivated] = false
      user.permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :rank, :deactivated)
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name email phone_number password password_confirmation rank deactivated])
  end
end
