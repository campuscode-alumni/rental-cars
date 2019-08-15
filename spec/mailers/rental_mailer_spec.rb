require 'rails_helper'

RSpec.describe RentalMailer, type: :mailer do
  describe '#send_rental_receipt' do
    it 'should send receipt' do
      subsidiary = create(:subsidiary)
      user = create(:user)
      car_model = create(:car_model)
      subsidiary_car_model = create(:subsidiary_car_model, car_model: car_model,
                                                           subsidiary: subsidiary)
      car = build(:car, car_model: car_model, subsidiary: subsidiary)
      customer = create(:customer, cpf: "123456789")
      rental = Rental.create(car: car, user: user, customer: customer)  

      mail = RentalMailer.send_rental_receipt(rental.id)
      expect(mail.to).to include customer.email
      expect(mail.body).to include "Segue recibo do #{car.car_model.name} - #{car.license_plate }"
      expect(mail.body).to include "Alugado em: #{rental.created_at}"
    end
  end
  describe "#send_return_receipt" do
    it 'should send receipt for returning a car' do
      subsidiary = create(:subsidiary)
      user = create(:user, subsidiary: subsidiary)
      manufacture = create(:manufacture)
      car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
      subsidiary_car_model = create(:subsidiary_car_model, car_model: car_model,
                                                           subsidiary: subsidiary)
      car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
      customer = create(:customer)
      rental = create(:rental, car: car, customer: customer, user: user)

      mail = RentalMailer.send_return_receipt(rental.id)
      expect(mail.to).to include customer.email
      expect(mail.subject).to eq 'Seu recibo de devolução'
      expect(mail.body).to include customer.name
      expect(mail.body).to include car.car_model.name
      expect(mail.body).to include rental.finished_at
    end 
  end
end
