class Rental < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :customer
  has_one :credit, as: :transactable

  validate :customer_cannot_rental_twice, on: %i[new create]
  validate :validate_car_has_price, on: %i[new create]

  def customer_cannot_rental_twice
    if customer.opened_rentals_count > 0
      errors.add(:customer_id, 'Cliente possui locação em aberto')
    end
  end

  def estimated_amount
    price = car.price
    rental_days = (Time.zone.now - start_at).to_i / 1.day

    amount = (price * rental_days).to_f
    amount == 0 ? price : amount
  end

  def calculate_amount
    price = car.price
    rental_days = (finished_at - start_at).to_i / 1.day

    amount = (price * rental_days).to_f
    amount == 0 ? price : amount
  end

  def finalize!(car_km:)
    return false unless car.update(car_km: car_km, status: :available)
    
    return false unless update(finished_at: Time.zone.now)

    create_credit(amount: calculate_amount, 
                  subsidiary: car.subsidiary)
    
    true
  end

  def validate_car_has_price
    if car.car_model.subsidiary_car_models.any?
      true
    else
      errors.add(:car_id, "Esta locação não pode ser cadastrada," \
                 " pois o carro não possui preço")
      return false
    end
  end
end
