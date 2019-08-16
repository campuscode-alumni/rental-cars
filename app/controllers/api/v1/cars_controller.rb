class Api::V1::CarsController < Api::V1::ApiController
  def show
    car = Car.find(params[:id])

    render json: car, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: "Not found", status: 404
  end
end