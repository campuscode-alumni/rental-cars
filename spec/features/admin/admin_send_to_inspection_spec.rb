require 'rails_helper'

feature 'User send car to inspection' do
  scenario 'successfully' do 
  
    # dados
    subsidiary = create(:subsidiary)
    user = create(:user, subsidiary: subsidiary)
    palio = create(:car_model, name: 'Palio' )
    car = create(:car, car_model: palio, license_plate: "xlg1234", 
                       subsidiary: user.subsidiary)
    customer = create(:customer, cpf: "123456789" )                          
    # acoes
    login_as user 
    visit root_path
    click_on 'Palio-xlg1234'
    click_on 'Enviar para vistoria'
    fill_in 'Funcionário', with: user.name
    select '1/4', from: 'Nível de combustível'
    select 'Limpo', from: 'Limpeza'

    expect(page).not_to have_link('Enviar para vistoria')
    expect(page).to have_content("Status: Em vistoria")
    expect(page).not_to have_link('Enviar para manutenção')
  end
end    