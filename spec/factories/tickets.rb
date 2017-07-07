FactoryGirl.define do
  factory :ticket do
    user nil
    event nil
    starts_at "2017-07-07 11:15:32"
    ends_at "2017-07-07 11:15:32"
    price "9.99"
    total "9.99"
  end
end
