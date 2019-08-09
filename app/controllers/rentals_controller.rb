class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @cars = current_user.subsidiary.cars
    @customers = Customer.all
  end

  def create
    customer = Customer.find(params[:rental][:customer_id])
    @rental = current_user.rentals.new(rental_params)
    if @rental.save
      RentalMailer.send_rental_receipt(@rental.id)
      flash[:notice] = 'Um email de confirmação foi enviado para o cliente'
      return redirect_to @rental
    end   
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