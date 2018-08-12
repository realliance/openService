require 'rails_helper'

RSpec.describe Participant, type: :model do
  it 'is valid with valid attributes' do
    expect(FactoryBot.build(:participant)).to be_valid
  end

  it 'is invalid without a user' do
    expect(FactoryBot.build(:participant, user: nil)).not_to be_valid
  end

  it 'is invalid without a event' do
    expect(FactoryBot.build(:participant, event: nil)).not_to be_valid
  end

  it 'is invalid without a set hours' do
    expect(FactoryBot.build(:participant, hours: nil)).not_to be_valid
  end

  it 'is invalid if gaining hours greater than what is possible in the event' do
    expect(FactoryBot.build(:participant, hours: 99)).not_to be_valid
  end
end