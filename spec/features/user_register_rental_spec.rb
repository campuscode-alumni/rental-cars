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

    select "#{car.car_identification}", from: 'Carro'
    select "#{customer.cpf_name}", from: 'Cliente'
    click_on 'Enviar'
    
    #expectativas

    expect(page).to have_content(car.car_identification)
    expect(page).to have_content("#{customer.cpf_name}")
    expect(page).to have_content(user.email)
    
  end 

  scenario 'ensure only cars on current subsidiary' do 
    #dados
    sub_paulista = create(:subsidiary, name: 'Paulista')
    sub_sao_miguel = create(:subsidiary, name: 'São Miguel')
    user_paulista = create(:user, subsidiary: sub_paulista)
    user_sao_miguel = create(:user, subsidiary: sub_sao_miguel)
    manufacture = create(:manufacture)
    palio = create(:car_model, name: 'Palio', manufacture: manufacture)
    onix = create(:car_model, name: 'Ônix', manufacture: manufacture)
    car_paulista = create(:car, car_model: palio, license_plate: 'ABC-1234', color: 'Azul', subsidiary: sub_paulista)
    car_sao_miguel = create(:car, car_model: onix, license_plate: 'CXZ-0987', color: 'Verde', subsidiary: sub_sao_miguel)
    customer = create(:customer)

    # acoes
    login_as user_paulista
    visit root_path
    click_on 'Registrar Locação'

    expect(page).to_not have_content(car_sao_miguel.car_identification)
    expect(page).to have_content(car_paulista.car_identification)

  end
end