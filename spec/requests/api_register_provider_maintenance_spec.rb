require 'rails_helper'

RSpec.describe 'Providers API', type: :request do
  context 'create provider' do
    it 'create success' do
      post '/api/v1/providers', params: {provider:{ name: 'Mecanica do Zé', cnpj: '0190/0001-23'}} 
      
      expect(response.status).to eq 201
      expect(response.body).to include 'Mecanica do Zé'
      expect(response.body).to include '0190/0001-23'
    end 

    it 'create success' do
      post '/api/v1/providers', params: {provider:{ name: '', cnpj: ''}} 
      
      expect(response.status).to eq 412
      expect(response.body).to include 'Nome não pode ficar em branco'
      expect(response.body).to include 'CNPJ não pode ficar em branco'
    end 

    it 'create success' do
      provider = Provider.create(name: 'Mecanica do Zé', cnpj: '092322/0923-12')
      post '/api/v1/providers', params: {provider:{ name: 'Mecanica do Zé-RJ', 
                                                    cnpj: '092322/0923-12'}} 
      
      expect(response.status).to eq 412
      expect(response.body).to include 'CNPJ já está em uso'
    end 
  end
end