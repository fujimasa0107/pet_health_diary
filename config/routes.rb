Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'daily_logs#index'

  resources :users do
    resources :pets, only: [:new, :create, :edit , :update]
  end

  resources :daily_logs, only: [:index, :new, :create, :show, :edit , :update]
end