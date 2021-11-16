Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users

  concern :importable do
    post :import, on: :collection
  end

  concern :exportable do
    get :export, on: :collection
  end

  resources :users, concerns: [:importable, :exportable] do
    post :wakeup, on: :member
  end

  resources :organizations, only: [:index]
end
