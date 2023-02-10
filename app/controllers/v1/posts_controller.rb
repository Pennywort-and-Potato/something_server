class V1::PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  before_action :set_user_posts, :set_current_user_posts, only: %i[ current_user_posts ]
  before_action :set_user_posts, only: [:user_posts]
  skip_before_action :authenticate_request, only: [:user_posts]


  def show
    render json: {
      data: @post.as_json(include: :content),
      success: true
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
        data: post.as_json(include: :content),
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

  def update
    if @post[:user_id] != @current_user[:id]
      return forbidden()
    end

    if @post.update(post_params)
      render json: {
        data: @post.as_json(include: :content),
        success: true
      },
      status: :ok
    else
      render json: {
        error: @post.errors,
        success: false
      },
      status: :unprocessable_entity
    end
  end

  def user_posts
    render json: {
      data: @user_posts.as_json(include: :content),
      success: true
    },
    status: :ok
  end

  def current_user_posts
    render json: {
      data: @current_user_posts.as_json(include: :content),
      success: true
      },
    status: :ok
  end

  private
    def set_post
      @post = Post.find(params[:id])

      if @post[:is_deleted]
        return not_found("Post")
      end

      @post.update(view: @post[:view] + 1)

      rescue ActiveRecord::RecordNotFound
        return not_found("Post")
    end

    def set_user_posts
      @user_posts = Post.where(user_id: params[:user_id], is_deleted: false)

      @user_posts.each do |post|
        post.update(view: post[:view] + 1)
      end

      rescue ActiveRecord::RecordNotFound
        return not_found("Post")
    end

    def set_current_user_posts
      @current_user_posts = Post.where(user_id: @current_user[:id])

      @current_user_posts.each do |post|
        post.update(view: post[:view] + 1)
      end

      rescue ActiveRecord::RecordNotFound
        return not_found("Post")
    end

    def post_params
      params.permit(:title, :body)
    end
end
