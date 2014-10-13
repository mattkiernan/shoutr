Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resources :following_relationships, only: [:new, :create]
  end

  root("shouts#index")

  resources :shouts, only: [:new, :create, :show,:index]

end
