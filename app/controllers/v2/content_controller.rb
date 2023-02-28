class V2::ContentController < ApplicationController
before_action :set_content, only: %i[ get_content_by_id deactive_content ]
skip_before_action :authenticate_request, only: %i[ get_content_by_id get_content_by_post_id get_content_by ]

  def get_content_by_id
    render json: {
      data: @content.as_json(include: :post),
      success: true
    }, status: :ok
  end

  def get_content_by_post_id

    chunk = params[:chunk] || 30
    page = params[:page] && params[:page] - 1 || 0
    offset = page * chunk

    contents = Content.includes(:post)
                      .where(post: {is_deleted: false, id: params[:id]})
                      .order(id: :asc).limit(chunk).offset(offset)
    render json: {
      data: contents.as_json(include: :post),
      success: true
    }, status: :ok
  end

  def get_content_by

    paramx = find_content_params.merge({is_deleted: false})

    chunk = params[:chunk] || 30
    page = params[:page] && params[:page] - 1 || 0
    offset = page * chunk

    contents = Content.includes(:post)
                      .where({post: {is_deleted: false}, **find_content_params})
                      # .where(find_content_params)
                      .order(id: :asc).limit(chunk).offset(offset)

    render json: {
      data: contents.as_json(include: :post),
      success: true
    }, status: :ok
  end

  def create_content 
    
  end

  def deactive_content
    if @content.post[:user_id] != @current_user[:id]
      return forbidden()
    end

    if @content.update(is_deleted: true)
      render json: {
        data: @content
      }, status: :ok
    else
      render json: {
        error: @content.error,
        success: false
      }, status: :unprocessable_entity
    end
  end

  private

  def set_content
    @content = Content.find(params[:id])

    if @content[:is_deleted] || @content.post[:is_deleted]
      return not_found("Content")
    end

    rescue ActiveRecord::RecordNotFound
      return not_found("Content")
  end

  def find_content_params
    params.permit(:alt, :src, :id)
  end
end