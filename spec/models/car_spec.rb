require 'rails_helper'

RSpec.describe Car, type: :model do
  
  describe "#last_available_cars" do
    
    it "should list only available cars" do
      
      create_list(:car, 5, status: :available, car_model: create(:car_model, name: 'Palio'))
      create_list(:car, 5, status: :on_maintenance, car_model: create(:car_model, name: 'Palio'))
      
      cars = Car.last_available_cars
      expect(cars.select{|car| car[:status] == 'available' }.size).to eq 5
    end
  end
end
