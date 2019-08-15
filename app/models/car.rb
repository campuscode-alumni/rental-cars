class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary
  has_many :maintenances
  has_many :inspections
  has_many :fines
  
  has_many :rentals

  enum status: { available: 0, on_maintenance: 5 }

  validates :car_model, :car_km, :color, :license_plate, presence: true

  validate :car_km_can_not_be_less_than_actual, on: :update

  def car_identification
    "#{car_model.name} - #{license_plate}"
  end
  
  def current_maintenance
    maintenances.last if on_maintenance?
  end

  def car_km_can_not_be_less_than_actual
    if car_km < car_km_was
      errors.add(:car_km, 'Quilometragem não pode ser menor que a atual')
    end
  end

  def price
    car_price = car_model.subsidiary_car_models.find_by(subsidiary: subsidiary)
    if car_price
      car_price.price.to_f
    else 
      raise 'Carro não possui preço cadastrado'
    end
    
  end
end
