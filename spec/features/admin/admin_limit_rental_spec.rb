require 'rails_helper'

feature 'User register rental' do
  scenario 'successfully' do 
  
    # dados
    subsidiary = create(:subsidiary)
    user = create(:user, subsidiary: subsidiary)
    manufacture = create(:manufacture)
    car_model = create(:car_model, manufacture: manufacture)
    car = create(:car, car_model: car_model, subsidiary: user.subsidiary)
    customer = create(:customer, cpf: "123456789" )
    rental = Rental.create(car: car, user: user, customer: customer)                           
    # acoes
    login_as user 
    visit root_path
    click_on 'Registrar Locação'

    select "#{car.car_identification}", from: 'Carro'
    select "#{customer.cpf}", from: 'Cliente'
    click_on 'Enviar'
    
    #expectativas

    # expect(current_path).to eq new_rental_path
    expect(page).to have_content('Cliente possui locação em aberto')
  end 
end