FactoryBot.define do
  factory :participant do
    association :event
    association :user
    hours 0
  end
end
