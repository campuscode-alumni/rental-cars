class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary
  has_many :maintenances

  enum status: { available: 0, on_maintenance: 5 }

  validates :car_model, :car_km, :color, :license_plate, presence: true

  def car_identification
    "#{car_model.name} - #{license_plate}"
  end
end
