FactoryBot.define do
  factory :car_model do
    name { Faker::Vehicle.make_and_model }
    year { Faker::Vehicle.year }
    manufacture
    car_options { Faker::Color.color_name }
  end
end
