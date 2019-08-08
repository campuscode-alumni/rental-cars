require 'rails_helper'

feature 'User return car from maintenance' do
  scenario 'successfully' do
    # dados
    user = create(:user)
    provider = Provider.create(name: 'Solucoes.ltda', cnpj: '1234567/777')
    fiat = create(:manufacture, name: 'Fiat')
    palio = create(:car_model, name: 'Palio', manufacture: fiat )
    car = create(:car, car_model: palio, license_plate: "xlg1234", status: :on_maintenance)
    maintenance = create(:maintenance, car: car, provider: provider)

    # acoes
    login_as user, scope: :user
    visit root_path
    
    click_on 'Carros em Manutenção'
    click_on 'Palio - xlg1234'
    click_on 'Dar baixa em manutenção'
    fill_in 'Nota Fiscal', with: 'NF0137'
    fill_in 'Valor', with: '2500'
    click_on 'Retornar de manutenção'

    # expectativas
    expect(page).to have_content('NF0137')
    expect(page).to have_content('2500')
    expect(page).to have_content('Carro disponível')
    expect(current_path).to eq car_return_maintenance_path(maintenance)
    expect(page).to have_content('Status: Disponível')
    expect(page).not_to have_link('Retornar de manutenção')
  end

  scenario ''
end