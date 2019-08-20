class Api::V1::CustomersController < Api::V1::ApiController
  def create
    customer = Customer.create(customer_params)
    render json: customer, status: 201
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :cpf, :phone)
  end
end