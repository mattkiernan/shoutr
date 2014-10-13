Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root("shouts#index")

  resources :shouts, only: [:new, :create, :show,:index]
end
