class Customer < ApplicationRecord
  validates :name, :email, :cpf, :phone, presence: true
end
