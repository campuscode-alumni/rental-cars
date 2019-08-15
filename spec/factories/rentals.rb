FactoryBot.define do
  factory :rental do
    car
    user 
    start_at { Time.zone.now }
    customer
  end
end
