FactoryBot.define do
  factory :car do
    car_model
    car_km { 200 }
    license_plate { "ABC1234" }
    color { "Azul" }
    subsidiary
  end
end
