Rails.application.routes.draw do
  resources :users do
    post :wakeup, on: :member
  end

  resources :organizations, only: [:index]
end
