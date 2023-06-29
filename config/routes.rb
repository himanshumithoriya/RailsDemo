Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  get "/index", to: "users#index"
  resources :users
  
  get "/login" => "users#login"
  post "/login1" => "users#login1"
end
