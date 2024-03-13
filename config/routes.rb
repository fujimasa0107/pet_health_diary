Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'daily_logs#index'

  resources :users do
    resources :pets, only: [:new, :create, :edit , :update]
  end

  #管理に関するルーティング
  resources :daily_logs

  # 記事に関するルーティング
  resources :articles, only: [:index, :new, :create, :show]  # 全ての記事を表示するためのルーティング
  get 'checks/:id', to: 'checks#check', as: 'check'
  post 'checks/:id/revert_check', to: 'checks#revert_check', as: 'revert_check'
end