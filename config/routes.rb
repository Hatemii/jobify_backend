Rails.application.routes.draw do
  resources :users
  resources :jobs
  resources :candidates
  resources :companies

  post "/login", to: "sessions#login"
end
