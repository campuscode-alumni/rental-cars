require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe 'create' do 
    it 'Should create successfully' do 
      subsidiary = build(:subsidiary)
      user = build(:user, subsidiary: subsidiary)
      car = build(:car, subsidiary: user.subsidiary)
      customer = build(:customer, cpf: "123456789" )
      rental = Rental.new(car: car, user: user, customer: customer) 

     expect(rental).to be_valid
    end  

    it 'Should not create' do 
      subsidiary = build(:subsidiary)
      user = build(:user, subsidiary: subsidiary)
      car = build(:car, subsidiary: user.subsidiary)
      customer = build(:customer, cpf: "123456789" )
      Rental.create(car: car, user: user, customer: customer) 
      rental = Rental.new(car: car, user: user, customer: customer)

     expect(rental).to be_invalid
    end  
  end  
end
