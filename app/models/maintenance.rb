class Maintenance < ApplicationRecord
  belongs_to :car
  belongs_to :provider
  has_one :debit, as: :transactable
  
  validates :invoice, 
            :service_cost, 
            presence: true, 
            on: :update

  scope :cars_on_maintenance, -> do
    joins(:car).where(cars: { status: :on_maintenance })
  end

  def car_return(params)
    errors.add(:invoice, 'Nota Fiscal não pode ficar em branco') if params[:invoice].blank?
    errors.add(:service_cost, 'Valor não pode ficar em branco') if params[:service_cost].blank?
    return false if errors.any?

    if update(params)
      car.available!
      create_debit(amount: params[:service_cost],
                   subsidiary: car.subsidiary)
    else
      return false
    end
  end
end
