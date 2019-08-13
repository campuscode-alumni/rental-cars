class Maintenance < ApplicationRecord
  belongs_to :car
  belongs_to :provider

  scope :cars_on_maintenance, -> do
    joins(:car).where(cars: { status: :on_maintenance })
  end

  def car_return(params)
    errors.add(:invoice, 'Nota Fiscal não pode ficar em branco') if params[:invoice].blank?
    errors.add(:service_cost, 'Valor não pode ficar em branco') if params[:service_cost].blank?
    return false if errors.any?

    update(params)
    car.available!
    Debit.create(amount: params[:service_cost],
                 subsidiary: car.subsidiary)
  end
end
