class HomeController < ApplicationController
  def index
    @cars = Car.where(status: :available).order(:updated_at).last(10)
    @all_cars = Car.all - @cars
  end
end
