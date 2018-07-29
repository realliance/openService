FactoryBot.define do
  factory :event do
    title FFaker::Lorem.phrase
    description FFaker::Lorem.paragraph
    start_time DateTime.new(2018, 3, 5, 14, 15)
    end_time DateTime.new(2018, 3, 5, 16, 15)
    location FFaker::Address.street_address
    user_id { FactoryBot.create(:user, rank: 2).id }
  end
end
