FactoryGirl.define do
  factory :item do
    name Faker::Lorem.sentence
    user
  end
end
