class MaintenancesController < ApplicationController

  def new
    @car = Car.find(params[:car_id])
    @maintenance = Maintenance.new
    # @maintenance.car = @car
  end

  def create
    @maintenance = Maintenance.new
    @maintenance.car = Car.find(params[:car_id])
    @maintenance.provider = Provider.find(params[:maintenance][:provider_id])
    @maintenance.car.on_maintenance!
    @maintenance.save
    flash[:notice] = 'Carro enviado para manutenção'
    redirect_to @maintenance.car
  end
end  