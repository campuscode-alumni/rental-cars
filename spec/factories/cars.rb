FactoryBot.define do
  factory :car do
    car_model { nil }
    car_km { 200 }
    license_plate { "ABC1234" }
    color { "Azul" }
    subsidiary { nil }
  end
end
