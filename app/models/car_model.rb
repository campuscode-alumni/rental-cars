class CarModel < ApplicationRecord
  belongs_to :manufacture
  has_many :subsidiary_car_models

  validates :name, presence: { message: 'Nome não pode ficar em branco' }
  validates :year, presence: { message: 'Ano não pode ficar em branco' }
  validates :car_options, presence: { message: 'Características não pode '\
                                               'ficar em branco' }
end
