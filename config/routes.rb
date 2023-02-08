Rails.application.routes.draw do
  # User
  get "/user/get/:id", to: "users#show"
  post "/user/create", to: "users#create"
  put "/user/update", to: "users#update"
  delete "/user/delete", to: "users#destroy"
  get "/user/me", to: "users#me"
  # Post
  get "/post/get/:id", to: "posts#show"
  post "/post/create", to: "posts#create"
  put "/post/update", to: "posts#update"

  get "/post/me", to: "posts#current_user_posts"
  get "/post/user/get/:user_id", to: "posts#user_posts"

  # Post Content
  get "/post/content/all", to: "contents#index"
  get "/post/content/get/:id", to: "contents#show"
  post "/post/content/add", to: "contents#create"

  # Authenticate
  post "/login", to: "auth#login"
  post "/register", to: "users#create"
  # Admin
  get "/admin/user/all", to: "admin#all_user"
  get "/admin/user/get/:id", to: "admin#get_user"

  get "/admin/post/all", to: "admin#all_post"

  get "/admin/post/content/all", to: "admin#all_content"

end
