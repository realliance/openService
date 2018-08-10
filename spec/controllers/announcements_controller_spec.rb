require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
  login_admin

  let(:announcement) do
    FactoryBot.create(:announcement)
  end

  let (:valid_params) do
    announcement = FactoryBot.build(:announcement)
    {title: announcement.title, description: announcement.description}
  end

  let (:valid_params_update) do
    announcement = FactoryBot.build(:announcement, title: FFaker::Lorem.phrase)
    {title: announcement.title, description: announcement.description}
  end

  let (:invalid_params) do
    {title: nil, description: nil}
  end

  describe '#show' do
    before do
      get :show, params: {id: announcement.id}
    end

    it 'assigns announcement to @announcement' do
      expect(assigns[:announcement]).to eq(announcement)
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    before do
      get :new
    end

    it 'assigns a new announcement to @announcement' do
      expect(assigns[:announcement]).to be_a_new(Announcement)
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#edit' do
    before do
      get :edit, params: {id: announcement.id}
    end

    it 'assigns announcement to @announcement' do
      expect(assigns[:announcement]).to eq(announcement)
    end

    it 'returns HTTP status 200 (OK)' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      it 'creates a new announcement' do
        expect { post :create, params: {announcement: valid_params} }.to change(Announcement, :count).by(1)
      end

      it 'returns HTTP status 201 (Created)' do
        post :create, params: {announcement: valid_params}
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns HTTP status 400 (Bad Request)' do
        post :create, params: {announcement: invalid_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe '#update' do
    context 'with valid parameters' do
      before do
        put :update, params: {id: announcement.id, announcement: valid_params_update}
      end

      it 'updates the requested announcement' do
        announcement.reload
        expect(announcement.updated_at).not_to eq(announcement.created_at)
      end

      it 'returns HTTP status 200 (OK)' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns HTTP status 400 (Bad Request)' do
        put :update, params: {id: announcement.id, announcement: invalid_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
