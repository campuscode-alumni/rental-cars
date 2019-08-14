class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :customer
  has_one :credit, as: :transactable

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

    create_credit(amount: calculate_amount, 
                 subsidiary: car.subsidiary)
  end
end
