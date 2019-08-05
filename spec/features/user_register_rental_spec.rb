require 'rails_helper'

feature 'User register rental' do
  scenario 'successfully' do 
  
    # dados
    subsidiary = create(:subsidiary)
    user = create(:user, subsidiary: subsidiary)
    manufacture = create(:manufacture)
    car_model = create(:car_model, manufacture: manufacture)
    car = create(:car, car_model: car_model, subsidiary: user.subsidiary)
    customer = create(:customer)
                               
    # acoes
    login_as user 
    visit root_path
    click_on 'Registrar Locação'

    select "#{car.name}", from: 'Carro'
    select "#{customer.cpf_name}", from: 'Cliente'
    click_on 'Enviar'
    
    #expectativas

    expect(page).to have_content(car.name)
    expect(page).to have_content("#{customer.cpf_name}")
    expect(page).to have_content(user.email)
    
  end 
end