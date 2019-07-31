FactoryBot.define do
  factory :car_model do
    name { "MyString" }
    year { "MyString" }
    manufacture { nil }
    car_options { "MyText" }
  end
end
