class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end  

  def create
    @customer = Customer.new(customer_params)  
    if @customer.save
      redirect_to @customer 
      flash[:success] = "Cliente cadastrado com sucesso"
    end
  end  

  def show
    @customer = Customer.find(params[:id])
  end  

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :cpf, :phone)
  end  
end  