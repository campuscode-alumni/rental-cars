class Api::V1::ProvidersController < Api::V1::ApplicationController
  
  def create
    provider = Provider.new(provider_params)
    if provider.save       
      render json: provider, status: :created
    else 
      render json: provider.errors.full_messages, status: :precondition_failed  
    end
  end  
  
  private

  def provider_params
    params.require(:provider).permit(:name, :cnpj)
  end  
end  