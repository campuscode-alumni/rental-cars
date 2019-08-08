class RentalMailer < ApplicationMailer
  def send_return_receipt(car, rental)
    @customer = rental.customer
    @car = car
    @rental = rental
    mail(to: customer.email, subject: 'Seu recibo de devolução')
  end
end
