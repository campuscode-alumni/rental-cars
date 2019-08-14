require 'rails_helper'

RSpec.describe Rental, type: :model do
  context 'create' do 
    describe '#customer_cannot_rental_twice' do
      it 'Should create successfully' do 
        subsidiary = build(:subsidiary)
        user = build(:user, subsidiary: subsidiary)
        car = build(:car, subsidiary: user.subsidiary)
        customer = build(:customer, cpf: "123456789" )
        Rental.create(car: car, user: user, customer: customer, finished_at: Date.today) 
        rental = Rental.new(car: car, user: user, customer: customer) 

      expect(rental).to be_valid
      end  

      it 'Should not create' do 
        subsidiary = build(:subsidiary)
        user = build(:user, subsidiary: subsidiary)
        car = build(:car, subsidiary: user.subsidiary)
        customer = build(:customer, cpf: "123456789" )
        Rental.create(car: car, user: user, customer: customer, finished_at: nil) 
        rental = Rental.new(car: car, user: user, customer: customer)

      expect(rental).to be_invalid
      end  
    end  
  end
  
  describe '#calculate_amount' do
    it 'successfully' do
      subsidiary = create(:subsidiary)
      user = create(:user, subsidiary: subsidiary)
      manufacture = create(:manufacture)
      car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
      subsidiary_car_model = create(:subsidiary_car_model, price: '200', 
                                                          car_model: car_model, 
                                                          subsidiary: subsidiary)
      car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
      customer = create(:customer, email: 'lucas@gmail.com')
      rental = create(:rental, car: car, customer: customer, user: user, start_at: 2.days.ago)
      rental.finalize!

      expect(rental.calculate_amount).to eq 400.0
    end
    
    it 'one day' do
      subsidiary = create(:subsidiary)
      user = create(:user, subsidiary: subsidiary)
      manufacture = create(:manufacture)
      car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
      subsidiary_car_model = create(:subsidiary_car_model, price: '200', 
                                                          car_model: car_model, 
                                                          subsidiary: subsidiary)
      car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
      customer = create(:customer, email: 'lucas@gmail.com')
      rental = create(:rental, car: car, customer: customer, user: user, start_at: 1.days.ago)
      rental.finalize!

      expect(rental.calculate_amount).to eq 200.0
    end

    it 'same day' do
      subsidiary = create(:subsidiary)
      user = create(:user, subsidiary: subsidiary)
      manufacture = create(:manufacture)
      car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
      subsidiary_car_model = create(:subsidiary_car_model, price: '200', 
                                                          car_model: car_model, 
                                                          subsidiary: subsidiary)
      car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
      customer = create(:customer, email: 'lucas@gmail.com')
      rental = create(:rental, car: car, customer: customer, user: user, start_at: Time.zone.now)
      rental.finalize!

      expect(rental.calculate_amount).to eq 200.0
    end
  end
end
