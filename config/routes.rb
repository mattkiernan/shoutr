Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :index] do
    resource :following_relationship, only: [:create, :destroy]
  end

  root("dashboards#show")

  resources :shouts, only: [:new, :create, :show,:index] do
    resource :favorite, only: [:create, :destroy]
  end

  resources :text_subjects, only: [:new, :create]

  resources :image_subjects, only: [:new, :create]

  resources :followers, only: [:index]

  resource :search, only: [:show]

  resource :direct_shouts, only: [:show]

  resource :dashboard, only: [:show]

  get "/:username", to: "users#show", as: "user"
end
