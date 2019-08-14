require 'rails_helper'

feature 'List cars in home' do

  scenario 'successfully' do
    
    user = create(:user)
    login_as(user)

    create_list(:car, 10, car_model: create(:car_model, name: 'Palio'))
    create_list(:car, 5, car_model: create(:car_model, name: 'X1'))
    
    visit root_path

    expect(page).to have_content('X1', count: 5)
    expect(page).to have_content('Palio', count: 5)
    expect(page).not_to have_content('Palio', count: 10)
    
  end

  scenario 'has an option to view all cars' do
    
    user = create(:user)
    login_as(user)

    create_list(:car, 10, car_model: create(:car_model, name: 'Palio'))
    create_list(:car, 5, car_model: create(:car_model, name: 'X1'))
    
    visit root_path
    click_on "Ver todos"

    expect(current_path).to eq cars_path
    expect(page).to have_content('X1', count: 5)
    expect(page).to have_content('Palio', count: 10)
    
  end
end