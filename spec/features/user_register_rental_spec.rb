require 'rails_helper'

feature 'User register rental' do
  scenario 'successfully' do 
  
    # dados
    user = User.create(email: 'rafael@gmail.com',
                       password: '123456')
    subsidiary = Subsidiary.create(name: 'SJC')
    manufacture = Manufacture.create(name: 'Fiat')
    car_model = CarModel.create(name: 'Uno',
                                year: '2008',
                                manufacture: manufacture,
                                car_options: '3 portas')
    car = Car.create(car_model: car_model, 
                     car_km: 200,
                     license_plate: 'ABC1234',
                     color: 'Azul',
                     subsidiary: subsidiary)
    customer = Customer.create(name: 'Renan',
                               email: 'renan@gmail.com',
                               cpf: '410812')
    
    
                               
    # acoes
    login_as user 
    visit root_path
    click_on 'Registrar Locação'

    select 'Uno - ABC1234', from: 'Carro'
    select '410812 - Renan', from: 'Cliente'
    click_on 'Enviar'
    
    #expectativas

    expect(page).to have_content(car.name)
    expect(page).to have_content("#{customer.cpf} - #{customer.name}")
    expect(page).to have_content(user.email)
    
  end 
end