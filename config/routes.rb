Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'daily_logs#index'

  resources :users do
    resources :pets, only: [:new, :create, :edit , :update]
  end

  #管理に関するルーティング
  resources :daily_logs

  # 記事に関するルーティング
  resources :articles, only: [:index, :new]  # 全ての記事を表示するためのルーティング
  resources :categories do
    resources :articles, only: [:index, :new] # 特定のカテゴリーの記事を表示するためのルーティング
  end
end