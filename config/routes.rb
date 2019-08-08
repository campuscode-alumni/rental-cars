Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :car_models, only: %i[show new create]
  resources :subsidiaries, only: %i[show new create]
  resources :rentals, only: %i[show new create]
  resources :subsidiary_car_models, only: %i[show new create]
  resources :cars, only: %i[show new create] do
    resources :maintenances, only: %i[show new create edit update]
  end
  resources :customers, only: %i[show new create]
  resources :maintenances, only: %i[index] do
    member do
      get 'new_return'
      post 'maintenance_return'
    end
  end
end
