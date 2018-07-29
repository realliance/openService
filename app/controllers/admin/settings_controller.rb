class Admin::SettingsController < ApplicationController
  load_and_authorize_resource

  def show
    render
  end
end