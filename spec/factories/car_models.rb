FactoryBot.define do
  factory :car_model do
    name { Faker::Vehicle.make }
    year { Faker::Vehicle.year }
    manufacture
    car_options { Faker::Vehicle.car_options.first }
  end
end
