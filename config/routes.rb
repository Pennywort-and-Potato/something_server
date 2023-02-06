Rails.application.routes.draw do
  # User
  get "/users/all", to: "users#index"
  get "/users/get/:id", to: "users#show"
  post "/users/create", to: "users#create"
  # put "/users/update", to: "users#update"
  delete "/users/delete", to: "users#destroy"
  get "/users/me", to: "users#me"
  # Post
  get "/post/all", to: "posts#index"
  get "/post/get/:id", to: "posts#show"
  post "/post/create", to: "posts#create"
  put "/post/update", to: "posts#update"

  get "/post/user/all", to: "posts#current_user_posts"
  get "/post/user/get/:user_id", to: "posts#user_posts"

  # Post Content
  get "/post/content/all", to: "contents#index"
  get "/post/content/get/:id", to: "contents#show"
  post "/post/content/add", to: "contents#create"

  # Authenticate
  post "/login", to: "auth#login"
  post "/register", to: "users#create"

end
