FactoryBot.define do
  factory :car do
    car_model { nil }
    license_plate { "MyString" }
    car_km { 1 }
    color {"azul"}
  end
end
