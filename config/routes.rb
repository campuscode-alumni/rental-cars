Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :car_models, only: %i[show new create]
  resources :subsidiaries, only: %i[show new create]
  resources :rentals, only: %i[show new create] do
    member do
      get 'new_car_return'
      post 'return_car'
    end
  end
  resources :subsidiary_car_models, only: %i[show new create]
  resources :cars, only: %i[show new create] do
    resources :maintenances, only: %i[show new create edit update]
    resources :inspections, only: %i[ new create]
  end
  resources :customers, only: %i[show new create]
  resources :maintenances, only: %i[index] do
    member do
      get 'new_return'
      post 'car_return'
    end
  end
 resources :customers, only: %i[show new create]  
 resources :transactions, only: %i[index]
end
