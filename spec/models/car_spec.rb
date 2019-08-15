require 'rails_helper'

RSpec.describe Car, type: :model do
  describe '#price' do
    it 'ensure price has car model, subsidiary and subsidiary car model' do
      car_model = create(:car_model)
      subsidiary = create(:subsidiary)
      car = build(:car, car_model: car_model, subsidiary: subsidiary)

      expect {(car.price)}.to raise_error('Carro não possui preço cadastrado')
    end
  end
end