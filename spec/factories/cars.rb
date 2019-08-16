FactoryBot.define do
  factory :car do
    car_model { Faker::Vehicle.make_and_model }
    car_km { 200 }
    license_plate { Faker::Vehicle.singapore_license_plate }
    color { "Azul" }
    subsidiary

    trait :on_maintenance do
      status { :on_maintenance }

      after(:create) do |car|
        create(:maintenance, car: car)
      end
    end
  end
end
