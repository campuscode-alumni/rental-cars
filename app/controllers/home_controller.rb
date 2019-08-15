class HomeController < ApplicationController
  def index
    @cars = Car.last_available_cars
    @all_cars = Car.all - @cars
  end
end
