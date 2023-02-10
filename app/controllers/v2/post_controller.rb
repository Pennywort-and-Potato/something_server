class V2::PostController < ApplicationController
  before_action :set_post
  skip_before_action :set_post, only: %i[ get_post_by, get_post_by_user_id ]

  def get_post_by_id
    render json: {
      data: @post.as_json(include: :content),
      success: true
    },
    status: :ok
  end

  def get_post_by_user_id
    posts = Post.includes(:content)
                .where(content: {is_deleted: false})
                .where(user_id: params[:user_id], is_deleted: false)

    render json: {
      data: posts.as_json(include: :content),
      success: true
    }, status: :ok
  end

  def get_post_by

    if find_post_params.empty?
      return render json: {
        error: "Missing Params",
        success: false
      }, status: :bad_request
    end

    paramx = find_post_params.merge({is_deleted: false})

    posts = Post.includes(:content)
                .where(content: {is_deleted: false})
                .where(paramx)

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