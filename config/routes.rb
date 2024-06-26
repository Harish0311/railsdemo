Rails.application.routes.draw do
  root "store#index", as: 'root'
  get '/home', to: "store#index", as: "home"

  get "/auth/signup", to: "auth#get_signup", as: "signup"
  post "/auth/signup", to: "auth#post_signup"
  get "/auth/login", to: "auth#get_login" , as: "login"
  post "/auth/login", to: "auth#post_login", as: "test"
  post "/auth/logout", to: "auth#post_logout", as: "logout"

  get '/admin/create', to: "admin#create", as: "create"
  post '/admin/create', to: "admin#post_create"
  get '/admin/edit/:id', to: "admin#edit", as: "edit"
  post '/admin/edit/:id', to: "admin#post_edit"
  post '/admin/delete/:id', to: "admin#delete", as: "delete"

  get "up" => "rails/health#show", as: :rails_health_check
end
