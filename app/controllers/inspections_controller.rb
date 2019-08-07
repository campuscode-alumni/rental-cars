class InspectionsController < ApplicationController
  
  def create
    @car = Car.find(params[:car_id])
    redirec_to @car
  end
end