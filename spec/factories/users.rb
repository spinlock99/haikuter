# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:id)    { |n| n }
    sequence(:email) { |n| "user#{n}@test.com" }

    password "12345678"
  end
end
