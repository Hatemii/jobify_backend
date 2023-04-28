Rails.application.routes.draw do
  resources :users
  resources :jobs
  resources :candidates

  post "/login", to: "sessions#login"
end
