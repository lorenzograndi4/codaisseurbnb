Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]

  resources :events do
    resources :tickets, only: [:create]
  end

  resources :profiles, only: [:new, :edit, :create, :update]

  resources :photos

  get "about" => "pages#about"

  namespace :api do
    resources :events
  end

end
