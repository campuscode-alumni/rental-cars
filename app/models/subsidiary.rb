class Subsidiary < ApplicationRecord
  has_many :users
  has_one :address
  has_many :cars
  has_many :subsidiary_car_models
  has_many :transactions
  accepts_nested_attributes_for :address

  validates :name, presence: { message: 'Nome não pode ficar em branco' }

  def current_price(cm)
    current_price_car = subsidiary_car_models.where(car_model: cm).last
    if current_price_car
      return current_price_car.price.to_f
    else
      raise 'Esse carro não possui preço'
    end
  end
end
