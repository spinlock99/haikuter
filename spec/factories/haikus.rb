# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :haiku do
    association :user

    poem "MyText"
  end
end
