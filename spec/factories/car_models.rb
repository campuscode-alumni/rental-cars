FactoryBot.define do
  factory :car_model do
    name { "Uno" }
    year { "2008" }
    manufacture { nil }
    car_options { "3 portas" }
  end
end
