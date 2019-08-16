require 'rails_helper'

RSpec.describe 'Subsidiaries API', type: :request do 

  context 'get /subsidiaries/all' do
    
    it 'should list all subsidiaries' do

      create_list(:subsidiary, 2, name: 'Joao')
      create_list(:subsidiary, 2, name: 'Mateus')

      get '/api/v1/subsidiaries/list'
      
      parsed_body = JSON.parse(response.body)
      
      expect(response.status).to eq 200
      expect(parsed_body.size).to eq 4
      expect(response.body.match("Joao")).to eq 2
      
      # expect(parsed_body.select{}).to have_content('Joao', count: 2)
      # expect(parsed_body).to have_content('Mateus', count: 2)
    end
  end
end

[
  {

  },
  {

  }
]