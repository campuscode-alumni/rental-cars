class RentalMailer < ApplicationMailer
  def send_return_receipt(rental_id)
    @rental = Rental.find(rental_id)
    @customer = @rental.customer
    @car = @rental.car
    mail(to: @customer.email, subject: 'Seu recibo de devolução')
  end
end
