class Customer < ApplicationRecord
  has_many :rentals

  def cpf_name
    "#{cpf} - #{name}"
  end
end
