class ParticipantsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_with @participants
  end
  
  def create
    return head :bad_request if @participant.event.full?
    if @participant.save
      head :created, location: event_path(@participant.event)
    else
      render json: {error: @participant.errors}, status: :bad_request
    end
  end

  def destroy
    @participant.destroy
    head :ok
  end

  private

  def create_params
    parameters = params.require(:participant).permit(:user_id)
    parameters[:event_id] = params[:event_id]
    parameters
  end
end
