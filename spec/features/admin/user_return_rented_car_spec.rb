require 'rails_helper'

feature 'User return car rental' do
  scenario 'successfully' do
    subsidiary = create(:subsidiary)
    user = create(:user, subsidiary: subsidiary)
    manufacture = create(:manufacture)
    car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
    car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary)
    customer = create(:customer)
    Rental.create(car: car, customer: customer, user: user)
                               
    login_as user 
    visit root_path
    click_on 'Palio-xlg1234'
    click_on 'Devolução de carro'

    fill_in 'Quilometragem', with: '199'
    click_on 'Devolver carro'

    expect(current_path).to eq car_path(car)
    expect(page).to have_content('Carro devolvido com sucesso')
    expect(page).to have_content('Status: Disponível')
    expect(page).to have_content('Quilometragem: 199')

  end
end