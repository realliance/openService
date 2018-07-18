class Admin::SettingsController < ApplicationController
  before_action :verify_rank

  def show
    render
  end

  private

  def verify_rank
    unless can? :manage, Setting
      flash[:error] = "You must be an Admin to access the settings page."
      redirect_to root_path
    end
  end
end