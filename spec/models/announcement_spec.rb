require 'rails_helper'

RSpec.describe Announcement, type: :model do
  it 'is valid with valid attributes' do
    expect(FactoryBot.build(:announcement)).to be_valid
  end

  it 'is invalid without a title' do
    expect(FactoryBot.build(:announcement, title: nil)).not_to be_valid
  end

  it 'is invalid without a description' do
    expect(FactoryBot.build(:announcement, description: nil)).not_to be_valid
  end

  it 'is invalid without an author' do
    expect(FactoryBot.build(:announcement, user: nil)).not_to be_valid
  end
end
