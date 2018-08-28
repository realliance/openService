class ParticipantsController < ApplicationController
  load_and_authorize_resource

  def index
    @participants = Event.find_by(id: params[:event_id]).participants
    respond_with @participants
  end

  def sign_in_sheet
    @participants = Event.find_by(id: params[:event_id]).participants
    respond_with @participants do |format|
      format.html
      format.pdf do
        render pdf: 'sign_in_sheet'
      end
    end
  end

  def create
    return head :bad_request if @participant.event.full? || @participant.event.finished?
    if @participant.save
      head :created, location: event_path(@participant.event)
    else
      render json: { error: @participant.errors }, status: :bad_request
    end
  end

  def update
    if @participant.update(update_params)
      head :ok
    else
      render json: { error: @participant.errors }, status: :bad_request
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
    parameters[:hours] = Event.find_by(id: params[:event_id]).total_hours
    parameters
  end

  def update_params
    params.require(:participant).permit(:hours)
  end
end
