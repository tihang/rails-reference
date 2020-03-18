Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/players", to: "players#index"
  # get "/players/new", to: "players#new"
  # post "/players", to: "players#create"
  # get "/players/:id", to: "players#show"
  root to: "users#index"
  resources :users, only: [:index, :create]
  resources :sessions, only: [:index, :create]
  resources :players

  get "/logout", to: "sessions#destroy"
end
