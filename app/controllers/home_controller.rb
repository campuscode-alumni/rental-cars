class HomeController < ApplicationController
  def index
    @cars = Car.last(10)
  end
end
