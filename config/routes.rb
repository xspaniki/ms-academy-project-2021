Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users

  concern :importable do
    post :import, on: :collection
  end

  concern :exportable do
    get :export, on: :collection
  end

  concern :printable do
    get :print, on: :member
  end

  resources :users, concerns: [:importable, :exportable, :printable] do
    post :wakeup, on: :member
  end

  resources :organizations, only: [:index]
end
