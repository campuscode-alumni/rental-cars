require "rails_helper"

RSpec.describe RentalMailer, type: :mailer do
  describe "#send_return_receipt" do
    it 'should send receipt for returning a car' do
      subsidiary = create(:subsidiary)
      user = create(:user, subsidiary: subsidiary)
      manufacture = create(:manufacture)
      car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
      car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
      customer = create(:customer)
      rental = create(:rental, car: car, customer: customer, user: user)

      mail = RentalMailer.send_return_receipt(car, rental)
      expect(mail.to).to include customer.email
      expect(mail.subject).to eq 'Seu recibo de devolução'
      expect(mail.body).to include customer.name
      expect(mail.body).to include car.car_model.name
      expect(mail.body).to include rental.finished_at
    end 
  end
end
