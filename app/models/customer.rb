class Customer < ApplicationRecord
  has_many :rentals
  validates :name, :email, :cpf, :phone, presence: true

  def cpf_name
    "#{cpf} - #{name}"
  end

  def opened_rentals_count
    rentals.where(rentals: { finished_at: nil }).count
  end
end
