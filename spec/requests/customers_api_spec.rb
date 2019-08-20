require 'rails_helper'

RSpec.describe 'Customers API', type: :request do

  context 'post /customers' do
    it 'create successfully - 201' do
      post "/api/v1/customers/", params:{ customer: {name: 'Lucas',
                                                     email: 'lucas@email.com',
                                                     cpf: '12345678910',
                                                     phone: '11965689843'}
                                        }

      result = JSON.parse(response.body)
      
      expect(response.status).to eq 201
      expect(result['name']).to eq 'Lucas'
      expect(result['email']).to eq 'lucas@email.com'
      expect(result['cpf']).to eq '12345678910'
      expect(result['phone']).to eq '11965689843'
    end

    it 'unsuccessfully - 412' do
      post "/api/v1/customers/", params:{ customer: {name: '',
                                                     email: '',
                                                     cpf: '',
                                                     phone: ''}
                                        }
      
      result = JSON.parse(response.body)
      
      expect(response.status).to eq 412
      expect(result).to include 'Nome não pode ficar em branco'
      expect(result).to include 'E-mail não pode ficar em branco'
      expect(result).to include 'Cpf não pode ficar em branco'
      expect(result).to include 'Telefone não pode ficar em branco'
    end
  end
end