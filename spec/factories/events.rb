FactoryGirl.define do
  factory :event do
    name              { Faker::Lorem.word }
    description       { Faker::HarryPotter.quote }
    location          { Faker::Address.city }
    capacity          10
    includes_food     true
    includes_drinks   false
    starts_at         { Faker::Date.between(2.days.ago, 1.month.from_now) }
    ends_at           { Faker::Date.between(2.days.ago, 1.month.from_now) }
    price             { Faker::Commerce.price }
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
