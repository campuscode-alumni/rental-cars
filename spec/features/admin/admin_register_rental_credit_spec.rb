require 'rails_helper'

feature 'Admin register rental credit' do
  scenario 'successfully' do
    subsidiary = create(:subsidiary)
    user = create(:user, subsidiary: subsidiary)
    manufacture = create(:manufacture)
    car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
    subsidiary_car_model = create(:subsidiary_car_model, price: '200', 
                                                         car_model: car_model, 
                                                         subsidiary: subsidiary)
    car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
    customer = create(:customer, email: 'lucas@gmail.com')
    travel_to 2.days.ago do
      rental = create(:rental, car: car, customer: customer, user: user)
    end

    login_as user
    visit root_path
    click_on 'Palio - xlg1234'
    click_on 'Devolução de carro'
    
    fill_in 'Quilometragem', with: '199'
    click_on 'Devolver carro'
    click_on 'Transações'

    expect(page).to have_content("Crédito")
    expect(page).to have_content("R$ 400,00")
  end

  scenario 'confirm amount before register credit' do
    subsidiary = create(:subsidiary)
    user = create(:user, subsidiary: subsidiary)
    manufacture = create(:manufacture)
    car_model = create(:car_model, name: 'Palio', manufacture: manufacture)
    subsidiary_car_model = create(:subsidiary_car_model, price: '200', 
                                                         car_model: car_model, 
                                                         subsidiary: subsidiary)
    car = create(:car, car_model: car_model, license_plate:'xlg1234', subsidiary: subsidiary, car_km: '100')
    customer = create(:customer, email: 'lucas@gmail.com')
    travel_to 2.days.ago do
      rental = create(:rental, car: car, customer: customer, user: user)
    end

    login_as user
    visit root_path
    click_on 'Palio - xlg1234'
    click_on 'Devolução de carro'
    
    expect(page).to have_content('Total: R$ 400,00')
    expect(page).to have_selector(:link_or_button, 'Devolver carro')
  end
end