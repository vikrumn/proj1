Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  get "/new", to: "pokemons#new", as: "new"
  post "/create", to: "pokemons#create", as: "create"
  patch "/capture", to: "pokemons#capture", as: "capture"
  patch "/damage", to: "pokemons#damage", as: "damage"
end
