class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @car_models = CarModel.all
  end

  def create
    @car = Car.new(car_params)
    @car.subsidiary = current_user.subsidiary
    return redirect_to @car if @car.save
    
    @car_models = CarModel.all
    render :new
  end

  def show
    @car = Car.find(params[:id]) 
  end
  
  private

  def car_params
    params.require(:car).permit(%i[car_model_id car_km color license_plate])
  end
end