class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :customer

  validate :customer_cannot_has_more_than_one_rental

  def customer_cannot_has_more_than_one_rental
    if customer.rental?
      errors.add(:customer_id, 'Cliente possui locação em aberto')
    end
  end

end
