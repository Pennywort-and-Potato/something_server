Rails.application.routes.draw do

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  post "/users/create", to: "users#create"
  put "/users/update", to: "users#update"

  post "/login", to: "auth#login"
end
