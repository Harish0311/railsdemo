Rails.application.routes.draw do
  root  "hello#index",as:'root'
  get '/home',to: "hello#index"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  get '/admin',to: "admin#index"
  post '/admin', to: "admin#create" ,as: 'admin_create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  # Defines the root path route ("/")
  # root "posts#index"
end
