Rails.application.routes.draw do
  resources :users
  resources :jobs
  resources :candidates

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  default_url_options :host => "localhost:3000"
end
