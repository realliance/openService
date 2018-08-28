class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    @events = params[:finished].present? ? Event.finished_events : Event.unfinished_events
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
      head :created, location: event_path(@event)
    else
      render json: { error: @event.errors }, status: :bad_request
    end
  end

  def update
    if @event.update(update_params)
      head :ok
    else
      render json: { error: @event.errors }, status: :bad_request
    end
  end

  def destroy
    @event.destroy
    head :ok
  end

  private

  def create_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :location, :participant_slots, :manager_id)
  end

  def update_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :location, :participant_slots, :manager_id)
  end
end
