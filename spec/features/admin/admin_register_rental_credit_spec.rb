require 'rails_helper'

feature 'Admin register rental credit' do
  scenario 'successfully' do
    subsidiary = create(:subsidiary)
    user = create(:user, subsidiary: subsidiary)
    manufacture = create(:manufacture)
    car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
    car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
    customer = create(:customer, email: 'lucas@gmail.com')
    rental = create(:rental, car: car, customer: customer, user: user)
    
    login_as user 
    visit root_path
    click_on 'Palio-xlg1234'
    click_on 'Devolução de carro'
    
    fill_in 'Quilometragem', with: '199'
    click_on 'Devolver carro'
    click_on 'Transaçōes'

    expect(page).to have_content('Carro devolvido com sucesso')
    expect(page).to have_content()
  end
end