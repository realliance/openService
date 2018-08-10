class AnnouncementsController < ApplicationController
  load_and_authorize_resource

  def show
    respond_with @announcement
  end

  def new
    respond_with @announcement
  end

  def edit
    respond_with @announcement
  end

  def create
    if @announcement.save
      head :created, location: announcement_path(@announcement)
    else
      render json: {error: @announcement.errors}, status: :bad_request
    end
  end

  def update
    if @announcement.update_attributes(update_params)
      head :ok
    else
      render json: {error: @announcement.errors}, status: :bad_request
    end
  end

  def destroy
    @announcement.destroy
    head :ok
  end

  private

  def create_params
    create_p = params.require(:announcement).permit(:title, :description)
    create_p[:user] = current_user
    create_p
  end

  def update_params
    params.require(:announcement).permit(:title, :description)
  end
end
