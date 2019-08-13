FactoryBot.define do
  factory :maintenance do
    car { nil }
    provider { nil }
    service_cost { Faker::Number.positive }
  end
end
