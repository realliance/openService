FactoryBot.define do
  factory :user do
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    sequence(:email) { |n| "user#{n}@example.com" }
    phone_number FFaker::PhoneNumber.short_phone_number
    password { FFaker::Internet.password }
    password_confirmation { password }
    rank 1
  end
end
