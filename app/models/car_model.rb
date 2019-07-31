class CarModel < ApplicationRecord
  belongs_to :manufacture

  validates :name, presence: { message: 'Nome não pode ficar em branco' }
  validates :year, presence: { message: 'Ano não pode ficar em branco' }
  validates :car_options, presence: { message: 'Características não pode '\
                                               'ficar em branco' }
end
