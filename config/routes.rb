Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users

  concern :importable do
    post :import, on: :collection
  end

  resources :users, concerns: [:importable] do
    post :wakeup, on: :member
  end

  resources :organizations, only: [:index]
end
