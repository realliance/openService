class Admin::SettingsController < ApplicationController
  authorize_resource

  def dashboard
    render
  end

  def users
    @users = User.all
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

  private

  def modify_user_params
    params.require(:user).permit(:rank, :deactivated)
  end
end