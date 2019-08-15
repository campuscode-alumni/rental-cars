class HomeController < ApplicationController

  def index
    @available_cars = Car.last_available_cars
    @cars_on_maintenance = Car.where(status: :on_maintenance).first(10)
    @all_cars = Car.all - @available_cars - @cars_on_maintenance
  end
end
