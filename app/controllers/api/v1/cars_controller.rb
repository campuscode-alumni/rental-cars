class Api::V1::CarsController < Api::V1::ApplicationController
  def index
    subsidiary = Subsidiary.find(params[:subsidiary_id])
    render json: subsidiary.cars
  end  
end  