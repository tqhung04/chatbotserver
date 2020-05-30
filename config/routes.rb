Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :rooms, only: [:index]
  post "/login", to: "auth#create"
end
