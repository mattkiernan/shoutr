Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resource :following_relationship, only: [:create, :destroy]
  end

  root("shouts#index")

  resources :shouts, only: [:new, :create, :show,:index]

  resources :text_subjects, only: [:new, :create]

  resources :image_subjects, only: [:new, :create]

  resources :followers, only: [:index]

end
