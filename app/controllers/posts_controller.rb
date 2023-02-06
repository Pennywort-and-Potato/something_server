class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  before_action :set_user_posts, :set_current_user_posts, only: %i[ user_posts current_user_posts ]
  before_action :grant_admin_permission, only: %i[ index ]

  def index
    @posts = Post.all
    render json: {
      posts: @posts,
      success: true
    },
    status: :ok
  end

  def show
    render json: {
      post: @post,
      success: false
    },
    status: :ok
  end

  def create
    post = @current_user.post.new(
      title: params[:title],
      body: params[:body]
    )

    params[:contents].each do |content|
      post.content.new(
        alt: content[:alt],
        src: content[:src],
        content_type: content[:content_type]
      )
    end

    if post.save
      render json: {
        post: post,
        success: true
      },
      status: :created
    else
      render json: {
        error: post.errors,
        success: false
      },
      status: :unprocessable_entity
    end
  end

  # def update
  #   if @post.update(post_params)
  #     render json: @post
  #   else
  #     render json: {error: @post.errors, detail: "Update post fails, please try again!", success: false}, status: :unprocessable_entity
  #   end
  # end

  # def user_posts
  #   render json: {posts: @user_posts, success: true}, status: :ok
  # end

  # def current_user_posts
  #   render json: {posts: @current_user_posts, success: true}, status: :ok
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @current_user.post.find(params[:id])

      if @post[:is_deleted] && !is_admin(@current_user)
        return render json: {
          error: "Post not exist",
          success: false
        },
        status: :not_found
      end

      @post.update(view: @post[:view] + 1)

      rescue ActiveRecord::RecordNotFound
        return render json: {error: "Post not exist", success: false}, status: :not_found
    end

    def set_user_posts
      @user_posts = Post.where(user_id: params[:user_id], is_deleted: false)

      @user_posts.each do |post|
        post.update(view: post[:view] + 1)
      end

    rescue ActiveRecord::RecordNotFound
      return render json: {error: "Post not exist", success: false}, status: :not_found
    end

    def set_current_user_posts
      @current_user_posts = Post.where(user_id: @current_user[:id])
      @current_user_posts.each do |post|
        post.update(view: post[:view] + 1)
      end

    rescue ActiveRecord::RecordNotFound
      return render json: {error: "Post not exist", success: false}, status: :not_found
    end

    def post_params
      params.permit(:title, :body)
    end
end
