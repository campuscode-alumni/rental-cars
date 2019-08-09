require 'rails_helper'

describe RentalMailer do
  describe '#send_rental_receipt' do
    it 'should send receipt' do
      user = create(:user)
      car = create(:car, subsidiary: user.subsidiary)
      customer = create(:customer, cpf: "123456789" ) 
      rental = Rental.create(car: car, user: user, customer: customer)  

      mail = RentalMailer.send_rental_receipt(rental.id)
      expect(mail.to).to include customer.email
      expect(mail.body).to include "Segue recibo do #{car.car_model.name} - #{car.license_plate }" 
      expect(mail.body).to include "Alugado em: #{rental.created_at}"
    end
  end
end