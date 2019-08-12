class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary
  has_many :maintenances
  has_many :inspections
  
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
end
