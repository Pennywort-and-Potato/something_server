class V1::ContentsController < ApplicationController
  before_action :set_content, only: %i[ show update destroy ]

  def show
    render json: {
      data: @content.as_json(include: :post),
      success: true
    },
    status: :ok
  end

  def create
    @post = Post.find(params[:post_id])

    params[:contents].each do |content|
      @post.content.new(
        alt: content[:alt],
        src: content[:src],
        content_type: content[:content_type],
        post_id: params[:post_id]
      )
    end

    if @post.save
      render json: {
        data: @post.as_json(include: :content),
        success: true
      }, status: :created
    else
      render json: {
        error: @post.errors,
        success: false
      }, status: :unprocessable_entity
    end
  end

  def update
    if @content.post[:user_id] != @current_user[:id]
      return forbidden()
    end

    if @content.update(content_params)
      render json: {
        data: @content.as_json(include: :post),
        success: true
      }
    else
      render json: {
        error: @content.errors,
        success: false
      },
      status: :unprocessable_entity
    end
  end

  private
    def set_content
      @content = Content.find(params[:id])

      if @content[:is_deleted]
        return not_found("Content")
      end

      rescue ActiveRecord::RecordNotFound
        return not_found("Content")
    end

    def content_params
      params.permit(:alt, :src, :content_type)
    end
end
