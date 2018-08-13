FactoryBot.define do
  factory :event do
    title FFaker::Lorem.phrase
    description FFaker::Lorem.paragraph
    start_time DateTime.new(2075, 3, 5, 14, 15)
    end_time DateTime.new(2075, 3, 5, 15, 15)
    location FFaker::Address.street_address
    participant_slots FFaker::Random.rand(1..35)
    user_id { FactoryBot.create(:user, rank: 2).id }
  end
end
