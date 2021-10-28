Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users

  resources :users do
    post :wakeup, on: :member
  end

  resources :organizations, only: [:index]
end
