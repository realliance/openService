class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_with @events
  end

  def show
    respond_with @event
  end

  def new
    respond_with @event
  end

  def edit
    respond_with @event
  end

  def create
    if @event.save
      Participant.create(event: @event, user: @event.user) unless @event.user.present?
      head :created, location: event_path(@event)
    else
      render json: {error: @event.errors}, status: :bad_request
    end
  end

  def update
    if @event.update_attributes(update_params)
      head :ok
    else
      render json: {error: @event.errors}, status: :bad_request
    end
  end

  def destroy
    @event.destroy
    head :ok
  end

  private

  def create_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :location, :participant_slots, :user_id)
  end

  def update_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :location, :participant_slots, :user_id)
  end
end
