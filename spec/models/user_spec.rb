require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  subject(:ability) do
    Ability.new(user)
  end

  let(:user) do
    nil
  end

  context 'when logged out' do
    it 'can read Events' do
      is_expected.to be_able_to(:read, Event)
    end

    it 'cannot view the list of participants on an events' do
      is_expected.not_to be_able_to(:view_list, Participant)
    end
  end

  context 'when logged in' do
    context 'and unverified' do
      let(:user) do
        FactoryBot.create(:user, rank: 0)
      end

      it 'cannot join an event' do
        is_expected.not_to be_able_to(:create, FactoryBot.create(:participant, user: user))
      end
    end

    context 'as a member' do
      let(:user) do
        FactoryBot.create(:user, rank: 1)
      end

      it 'can view the list of participants on an events' do
        is_expected.to be_able_to(:view_list, Participant)
      end

      it 'can join an event' do
        is_expected.to be_able_to(:create, FactoryBot.create(:participant, user: user))
      end

      it 'cannot create an event' do
        is_expected.not_to be_able_to(:create, Event.new)
      end
    end

    context 'as an admin' do
      let(:user) do
        FactoryBot.create(:user, rank: 2)
      end

      it 'can manage events' do
        is_expected.to be_able_to(:manage, Event)
      end

      it 'can manage settings' do
        is_expected.to be_able_to(:manage, Setting)
      end
    end
  end
end