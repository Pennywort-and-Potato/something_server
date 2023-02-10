Rails.application.routes.draw do
  get "/" => redirect("https://github.com/Pennywort-and-Potato/something_server/blob/main/README.md")

  namespace :v1 do
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
  end

  namespace :v2 do
    get "/getUserByID/:id", to: "user#get_user_by_id"
    get "/getUserBy", to: "user#get_user_by"
    put "/updateUser", to: "user#update_user"
    delete "/deactiveUser", to: "user#deactive_user"

    get "/getPostByID/:id", to: "post#get_post_by_id"
    get "/getPostBy", to: "post#get_post_by"
    put "/updatePost", to: "post#update_post"
    delete "/deactivePost", to: "post#deactive_post"
  end

  post "/login", to: "authenticate/auth#login"
  post "/register", to: "authenticate/auth#create"
  get "/me", to: "authenticate/auth#me"

  namespace :admin do
    get "/user/all", to: "admin#all_user"
    get "/user/get/:id", to: "admin#get_user"

    get "/post/all", to: "admin#all_post"

    get "/post/content/all", to: "admin#all_content"
  end

end
