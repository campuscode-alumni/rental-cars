class FinesController < ApplicationController

def new
  @fine = Fine.new 
  @car = Car.find(params[:car_id])
end

def create
  @car = Car.find(params[:car_id])
  @fine = @car.fines.new(fine_params)

  if @fine.save!
    redirect_to @fine
    flash[:notice] = 'Multa registrada com sucesso'
  end
end


def fine_params
  params.require(:fine).permit(:issued_on, 
                               :demerit_points,
                               :fine_value,
                               :address)
end

end
