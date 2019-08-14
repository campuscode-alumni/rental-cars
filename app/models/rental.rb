class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :customer

  validate :customer_cannot_rental_twice

  def customer_cannot_rental_twice
    if customer.rental?
      errors.add(:customer_id, 'Cliente possui locação em aberto')
    end
  end

  def calculate_amount
    price = car.price
    rental_days = (finished_at - start_at).to_i / 1.day

    amount = (price * rental_days).to_f
    amount == 0 ? price : amount
  end

  def finalize!
    update(finished_at: Time.zone.now)

    Credit.create(amount: calculate_amount, 
                  subsidiary: car.subsidiary)
  end
end
