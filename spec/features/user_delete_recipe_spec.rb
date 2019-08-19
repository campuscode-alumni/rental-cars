require 'rails_helper'

feature 'User delete car' do
  scenario 'successfully', :js do
    user = create(:user)
    car = create(:car, subsidiary: user.subsidiary)

    login_as user, scope: :user
    visit root_path
    within "#car-#{car.id}" do
      click_on 'Apagar carro'
    end

    expect(page).not_to have_content(car.car_identification)
  end
end
