FactoryBot.define do
  factory :announcement do
    title FFaker::Lorem.phrase
    description FFaker::Lorem.paragraph
    association :user, rank: 2
  end
end
