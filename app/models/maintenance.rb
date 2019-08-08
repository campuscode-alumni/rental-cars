class Maintenance < ApplicationRecord
  belongs_to :car
  belongs_to :provider

  scope :cars_on_maintenance, -> do
    joins(:car).where(cars: { status: :on_maintenance })
  end
end
