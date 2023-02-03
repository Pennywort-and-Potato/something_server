class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  before_action :set_user_posts, :set_current_user_posts, only: %i[ user_posts current_user_posts ]
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    # data = JSON.parse(request.raw_post)
    puts params
    @post = @current_user.post.new(
      title: params[:title],
      body: params[:body],
      like: 0,
      dislike: 0,
      view: 0,
      rating: 0
    )

    params[:contents].each do |content|
      @post.content.new(
        alt: content[:alt],
        src: content[:src],
        content_type: content[:content_type],
        view: 0,
        like: 0,
        dislike: 0,
        rating: 0
      )
    end

    if @post.save
      render json: @post, status: :created
    else
      render json: {error: @post.errors, detail: "Create post fails, please try again!"}, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: {error: @post.errors, detail: "Update post fails, please try again!"}, status: :unprocessable_entity
    end
  end

  def user_posts
    render json: @user_posts
  end

  def current_user_posts
    render json: @current_user_posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @current_user.post.find(params[:id])
      @post.update(view: @post[:view] + 1)
    end

    def set_user_posts
      @user_posts = Post.where(user_id: params[:user_id])
      @user_posts.each do |post|
        post.update(view: post[:view] + 1)
      end
    end

    def set_current_user_posts
      @current_user_posts = Post.where(user_id: @current_user[:id])
      @current_user_posts.each do |post|
        post.update(view: post[:view] + 1)
      end
    end

    def post_params
      params.permit(:title, :body)
    end
end
