Rails.application.routes.draw do
  resources :users
  resources :jobs
  resources :candidates
  resources :companies
  resources :company_users, except: %i[index]

  get "/company_users/:company_id", to: "company_users#index"
  post "/login", to: "sessions#login"
end
