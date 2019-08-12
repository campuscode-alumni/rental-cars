class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end 
    
  def new
    @customer = Customer.new
  end  

  def create
    @customer = Customer.new(customer_params)  
    if @customer.save
      redirect_to @customer 
      flash[:success] = "Cliente cadastrado com sucesso"
    else 
      flash[:error] = "Você deve preencher todos os campos"  
      render :new
    end
  end  

  def show
    @customer = Customer.find(params[:id])
  end  

  def edit
    @customer = Customer.find(params[:id])
  end  

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
      flash[:success] = 'Cliente editado com sucesso'
    else
      flash[:error] = 'Você deve preencher todos os campos'
      render :edit  
    end  
  end  

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :cpf, :phone)
  end  
end  