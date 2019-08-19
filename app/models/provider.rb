class Provider < ApplicationRecord
  has_many :maintenances
  validates :name, :cnpj, presence: true
  validates :cnpj, uniqueness: true 
end
