require 'rails_helper'

RSpec.describe 'Cars API', type: :request do 
  context 'get/subsidiary/cars/1' do 
    it 'all cars by subsidiary' do
      subsidiary = create(:subsidiary)
      manufacture = create(:manufacture, name: 'Honda')
      car_model = create(:car_model, manufacture: manufacture, name: 'City')
      car = create(:car, license_plate: 'EQH-8038', car_model: car_model, subsidiary: subsidiary)

      get "/api/v1/subsidiaries/#{subsidiary.id}/cars"
      result = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.body).to include 'EQH-8038'
      expect(result.length).to eq 1
      expect(result.first['license_plate']).to eq 'EQH-8038'

    

    end
  end
end