Rails.application.routes.draw do
  get "/" => redirect("https://github.com/Pennywort-and-Potato/something_server/blob/main/README.md")

  scope :v1 do

    scope :user do
      get "/get/:id", to: "v2/user#get_user_by_id"
      get "/get", to: "v2/user#get_user_by"
      put "/update", to: "v2/user#update_user"
      delete "/delete", to: "v2/user#deactive_user"
    end

    scope :post do
      get "/get/:id", to: "v2/post#get_post_by_id"
      get "/user/:id", to: "v2/post#get_post_by_user_id"
      get "/get", to: "v2/post#get_post_by"
      put "/update", to: "v2/post#update_post"
      delete "/delete", to: "v2/post#deactive_post"
      post "/create", to: "v2/post#create_post"
    end

    scope :content do
      get "/get/:id", to: "v2/content#get_content_by_id"
      get "/post/:id", to: "v2/content#get_content_by_post_id"
      get "/get", to: "v2/content#get_content_by"
      delete "/delete", to: "v2/content#deactive_content"
    end
  end


  namespace :v2 do
    get "/getUserByID/:id", to: "user#get_user_by_id"
    get "/getUserBy", to: "user#get_user_by"
    put "/updateUser", to: "user#update_user"
    delete "/deactiveUser", to: "user#deactive_user"

    get "/getPostByID/:id", to: "post#get_post_by_id"
    get "/getPostByUserID/:id", to: "post#get_post_by_user_id"
    get "/getPostBy", to: "post#get_post_by"
    put "/updatePost", to: "post#update_post"
    delete "/deactivePost", to: "post#deactive_post"
    post "/createPost", to: "post#create_post"

    get "/getContentByID/:id", to: "content#get_content_by_id"
    get "/getContentByPostID/:id", to: "content#get_content_by_post_id"
    get "/getContentBy", to: "content#get_content_by"
    delete "/deactiveContent", to: "content#deactive_content"

    get "/getCollectionByID/:id", to: "collection#get_collection_by_id"
    get "/getCollectionBy", to: "collection#get_collection_by"
    post "/createCollection", to: "collection#create_collection"
    delete "/deactiveCollection", to: "collection#deactive_collection"

    post "/createTag", to: "tag#create_tag"
    get "/getTag", to: "tag#get_tag"
  end

  post "/login", to: "authenticate/auth#login"
  post "/register", to: "authenticate/auth#register"
  get "/me", to: "authenticate/auth#me"


  scope :image do
    get "/get/:file_name", to: "streaming/image#send_image"
    post "/upload", to: "streaming/upload#upload_image"
  end

  namespace :admin do
    get "/getAllUser", to: "admin#get_all_user"
    get "/getUser/:id", to: "admin#get_user"

    get "/getAllPost", to: "admin#get_all_post"
    get "/getPost/:id", to: "admin#get_post"

    get "/getAllContent", to: "admin#get_all_content"
    get "/getContent/:id", to: "admin#get_content"
  end

end
