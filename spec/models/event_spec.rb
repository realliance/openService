require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is valid with valid attributes' do
    expect(FactoryBot.build(:event)).to be_valid
  end

  it 'is invalid without a title' do
    expect(FactoryBot.build(:event, title: nil)).not_to be_valid
  end

  it 'is invalid without a description' do
    expect(FactoryBot.build(:event, description: nil)).not_to be_valid
  end

  it 'is invalid without a start_time' do
    expect(FactoryBot.build(:event, start_time: nil)).not_to be_valid
  end

  it 'is invalid without an end_time' do
    expect(FactoryBot.build(:event, end_time: nil)).not_to be_valid
  end

  it 'is invalid without a location' do
    expect(FactoryBot.build(:event, location: nil)).not_to be_valid
  end

  it 'is invalid without a participant slot count' do
    expect(FactoryBot.build(:event, participant_slots: nil)).not_to be_valid
  end

  it 'is invalid with a participant slot count of 0' do
    expect(FactoryBot.build(:event, participant_slots: 0)).not_to be_valid
  end

  it 'is valid if end_time is after start_time' do
    expect(FactoryBot.build(:event, end_time: DateTime.new(2112, 03, 05))).to be_valid
  end

  it 'is invalid if end_time is before start_time' do
    expect(FactoryBot.build(:event, end_time: DateTime.new(2010, 03, 05))).not_to be_valid
  end
end
