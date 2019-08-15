class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @cars = current_user.subsidiary.cars
    @customers = Customer.all
  end

  def create
    customer = Customer.find(params[:rental][:customer_id])
    @rental = current_user.rentals.new(rental_params)
    @rental.start_at = Time.zone.now
    
    if @rental.save
      RentalMailer.send_rental_receipt(@rental.id)
      flash[:notice] = 'Um email de confirmação foi enviado para o cliente'
      return redirect_to @rental
    end
    
    @cars = current_user.subsidiary.cars
    @customers = Customer.all
    render :new
  end

  def calcula_quilometragem

  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new_car_return
    @rental = Rental.find(params[:id])
    @car = @rental.car
    @calculated_amount = @rental.estimated_amount
  end

  def return_car
    @rental = Rental.find(params[:id])

    if @rental.finalize!(car_km: params[:car][:car_km])
      RentalMailer.send_return_receipt(@rental.id).deliver_now
      flash[:notice] = 'Carro devolvido com sucesso'
      redirect_to @rental.car
    else
      @car = @rental.car
      flash[:notice] = 'Nao foi possivel salvar'
      render :new_car_return
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:car_id,
                                  :customer_id)
  end
end