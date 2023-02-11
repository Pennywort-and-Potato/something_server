class V2::PostController < ApplicationController
  before_action :set_post, only: %i[ get_post_by_id update_post deactive_post ]
  skip_before_action :authenticate_request, only: %i[ get_post_by_user_id ]

  def get_post_by_id
    render json: {
      data: @post.as_json(include: :content),
      success: true
    },
    status: :ok
  end

  def get_post_by_user_id

    chunk = params[:chunk] || 30
    page = params[:page] && params[:page] - 1 || 0
    offset = page * chunk

    posts = Post.includes(:content)
                .where(content: {is_deleted: false})
                .where(user_id: params[:id], is_deleted: false)
                .order(id: :asc)
                .limit(chunk)
                .offset(offset)

    render json: {
      data: posts.as_json(include: :content),
      success: true
    }, status: :ok
  end

  def get_post_by

    paramx = find_post_params.merge({is_deleted: false})

    chunk = params[:chunk] || 30
    page = params[:page] && params[:page] - 1 || 0
    offset = page * chunk


    posts = Post.includes(:content)
                .where(content: {is_deleted: false})
                .where(paramx)
                .order(id: :asc)
                .limit(chunk)
                .offset(offset)

    render json: {
      data: posts.as_json(include: :content),
      success: true
    }, status: :ok
  end

  def update_post
    if @post[:user_id] != @current_user[:id]
      forbidden()
    end

    if @post.update(update_post_params)
      render json: {
        data: @post,
        success: true
      }, status: :ok
    else
      render json: {
        error: @posts.error,
        success: false
      }, status: :unprocessable_entity
    end
  end

  def deactive_post
    if @post[:user_id] != @current_user[:id]
      forbidden()
    end

    if @post.update(is_deleted: true)
      render json: {
        data: @post
      }, status: :ok
    else
      render json: {
        error: @posts.error,
        success: false
      }, status: :unprocessable_entity
    end
  end

  def create_post
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

  private

  def set_post
    @post = Post.find(params[:id])

    if @post[:is_deleted]
      return not_found("Post")
    end

    rescue ActiveRecord::RecordNotFound
      return not_found("Post")
  end

  def find_post_params
    params.permit(:title, :body, :id)
  end

  def update_post_params
    params.permit(:title, :body)
  end
end