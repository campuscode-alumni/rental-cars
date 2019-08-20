class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: "Not found", status: 404
  end
  
  rescue_from ActiveRecord::RecordInvalid do
    render json: "Not found", status: 412
  end
end