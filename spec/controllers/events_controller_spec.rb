require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  login_admin

  let(:event) do
    FactoryBot.create(:event)
  end

  let(:valid_params) do
    event = FactoryBot.build(:event)
    { title: event.title, description: event.description, start_time: event.start_time, end_time: event.end_time, participant_slots: event.participant_slots, location: event.location }
  end

  let(:valid_params_update) do
    event = FactoryBot.build(:event, title: FFaker::Lorem.phrase)
    { title: event.title, description: event.description, start_time: event.start_time, end_time: event.end_time, participant_slots: event.participant_slots, location: event.location }
  end

  let(:invalid_params) do
    { title: nil, description: nil, start_time: nil, end_time: nil, location: nil }
  end

  describe '#index' do
    before do
      get :index
    end

    it 'assigns all events to @events' do
      expect(assigns[:events]).to eq([event])
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    before do
      get :show, params: { id: event.id }
    end

    it 'assigns event to @event' do
      expect(assigns[:event]).to eq(event)
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it 'assigns a new event to @event' do
      expect(assigns[:event]).to be_a_new(Event)
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#edit' do
    before do
      get :edit, params: { id: event.id }
    end

    it 'assigns event to @event' do
      expect(assigns[:event]).to eq(event)
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      it 'creates a new event' do
        expect { post :create, params: { event: valid_params } }.to change(Event, :count).by(1)
      end

      it 'returns HTTP status 201 (Created)' do
        post :create, params: { event: valid_params }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns HTTP status 400 (Bad Request)' do
        post :create, params: { event: invalid_params }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#update' do
    context 'with valid parameters' do
      before do
        put :update, params: { id: event.id, event: valid_params_update }
      end

      it 'updates the requested event' do
        event.reload
        expect(event.updated_at).not_to eq(event.created_at)
      end

      it 'returns HTTP status 200 (OK)' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns HTTP status 400 (Bad Request)' do
        put :update, params: { id: event.id, event: invalid_params }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
