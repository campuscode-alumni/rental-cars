class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @cars = Car.all
    @customers = Customer.all
  end

  def create
    @rental = current_user.rentals.new(rental_params)
    return redirect_to @rental if @rental.save

    @cars = Car.all
    @customers = Customer.all
    render :new
  end

  def show
    @rental = Rental.find(params[:id])
  end

  private

  def rental_params
    params.require(:rental).permit(:car_id,
                                  :customer_id)
  end
end