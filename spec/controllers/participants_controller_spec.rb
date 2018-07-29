require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  login_admin

  let(:event) do
    FactoryBot.create(:event)
  end

  let (:valid_params) do
    { user_id: user.id }
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
