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

  def index
    @maintenances = Maintenance.cars_on_maintenance
  end

  def new_return
    @maintenance = Maintenance.find(params[:id])
  end
  
  def car_return
    @maintenance = Maintenance.find(params[:id])
    @car = @maintenance.car
    
    if @maintenance.car_return(maintenance_return_params)
      @car.available!
      flash[:notice] = 'Carro disponível'
    else
      render :new_return
    end
  end

  private

  def maintenance_return_params
    params.require(:maintenance).permit(:invoice, :service_cost)
  end
end
