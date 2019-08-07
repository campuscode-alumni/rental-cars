class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary
  has_many :maintenances
  has_many :rentals
  enum status: { available: 0, on_maintenance: 5 }

  validate :car_km_can_not_be_less_than_actual, on: :update
  validates :car_model, presence: { message: 'Modelo não pode ficar em branco' }
  validates :car_km, presence: { message: 'Quilometragem não pode ficar '\
                                          'em branco' }
  validates :color, presence: { message: 'Cor não pode ficar em branco' }
  validates :license_plate, presence: { message: 'Placa não pode '\
                                                 'ficar em branco' }

  def car_identification
    "#{car_model.name} - #{license_plate}"
  end

  def car_km_can_not_be_less_than_actual
    if car_km < car_km_was
      errors.add(:car_km, 'Quilometragem não pode ser menor que a atual')
    end
  end
end
