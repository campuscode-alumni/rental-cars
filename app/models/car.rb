class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary

  validates :car_model, presence: { message: 'Modelo não pode ficar em branco' }
  validates :car_km, presence: { message: 'Quilometragem não pode ficar '\
                                          'em branco' }
  validates :color, presence: { message: 'Cor não pode ficar em branco' }
  validates :license_plate, presence: { message: 'Placa não pode '\
                                                 'ficar em branco' }

  def name
    "#{car_model.name} - #{license_plate}"
  end
end
