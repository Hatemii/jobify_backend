Rails.application.routes.draw do
  resources :users
  resources :jobs
  resources :candidates
  resources :companies

  # custom routes
  resources :company_users, except: %i[index]
  get "/company_users/:company_id", to: "company_users#index"
  
  # sessions
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  delete "/logout", to: "sessions#logout"
end
