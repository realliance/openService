require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  login_admin

  let(:event) do
    FactoryBot.create(:event)
  end

  let(:small_event) do
    FactoryBot.create(:event, participant_slots: 1)
  end

  let (:second_user) do
    FactoryBot.create(:user)
  end

  let (:valid_params) do
    { user_id: user.id, hours: 0 }
  end

  let (:valid_params_second_user) do
    { user_id: second_user.id, hours: 0 }
  end

  let(:participant) do
    FactoryBot.create(:participant)
  end

  describe '#create' do
    context 'with valid parameters' do
      it 'creates a new participant' do
        expect { post :create, params: {event_id: event.id, participant: valid_params} }.to change(Participant, :count).by(1)
      end

      it 'returns HTTP status 201 (Created)' do
        post :create, params: {event_id: event.id, participant: valid_params}
        expect(response).to have_http_status(:created)
      end

      it 'returns HTTP Status 403 (Bad Request) if the event is full' do
        post :create, params: {event_id: small_event.id, participant: valid_params}
        
        post :create, params: {event_id: small_event.id, participant: valid_params_second_user}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#destroy' do
    it 'destroys the requested particpant' do
      participant.reload
      expect { delete :destroy, params: { event_id: event.id, id: participant.id } }.to change(Participant, :count).by(-1)
    end

    it 'returns HTTP status 200 (OK)' do
      delete :destroy, params: { event_id: event.id, id: participant.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
