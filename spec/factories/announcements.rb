FactoryBot.define do
  factory :announcement do
    title FFaker::Lorem.phrase
    description FFaker::Lorem.paragraph
    user_id { FactoryBot.create(:user, rank: 2).id }
  end
end
