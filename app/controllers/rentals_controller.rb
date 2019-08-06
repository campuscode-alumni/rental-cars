class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @cars = current_user.subsidiary.cars
    @customers = Customer.all
  end

  def create
    customer = Customer.find(params[:rental][:customer_id])
    customer.rentals.where('rentals.finished_at != ?', null)
    @rental = current_user.rentals.new(rental_params)

    return redirect_to @rental if @rental.save

    @cars = current_user.subsidiary.cars
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