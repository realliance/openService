class Admin::SettingsController < ApplicationController
  load_and_authorize_resource

  def dashboard
    render
  end

  def users
    @users = User.all
    respond_with @users
  end
end