class Admin::SettingsController < ApplicationController
  authorize_resource

  def dashboard
    render
  end

  def users
    @users = User.all.order('rank DESC')
    respond_with @users
  end

  def modify_user
    user = User.find_by(id: params[:id])
    if user.update_without_password(modify_user_params)
      head :ok
    else
      byebug
      render json: {error: user.errors}, status: :bad_request
    end
  end

  def settings
    @settings = Setting.get_all
    respond_with @settings
  end

  def update_settings
    return head :bad_request if params[:club].nil? || params[:navbarStyle].nil? || params[:navbarColor].nil?
    
    ActiveRecord::Base.transaction do
      Setting['club'] = params[:club]
      Setting['navbarStyle'] = params[:navbarStyle]
      Setting['navbarColor'] = params[:navbarColor]
    end

    head :ok
  end

  private

  def modify_user_params
    params.require(:user).permit(:rank, :deactivated)
  end
end