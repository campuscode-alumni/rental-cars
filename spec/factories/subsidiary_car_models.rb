FactoryBot.define do
  factory :subsidiary_car_model do
    price { 10 }
    subsidiary
    car_model 
  end
end
