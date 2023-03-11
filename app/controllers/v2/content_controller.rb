class V2::ContentController < ApplicationController
before_action :set_content, only: %i[ get_content_by_id deactive_content ]
skip_before_action :authenticate_request, only: %i[ get_content_by_id get_content_by_post_id get_content_by ]

  def get_content_by_id
    send_response(@content.as_json(include: :post))
  end

  def get_content_by_post_id
    query_limit = get_query_limit(params[:chunk], params[:page])
    criteria = {
      post: {
        is_deleted: false,
        id: params[:id]
      }
    }

    contents = get_content_by_criteria(criteria, chunk, offset)

    send_response(contents.as_json(include: :post))
  end

  def get_content_by
    query_limit = get_query_limit(params[:chunk], params[:page])
    criteria = {
      is_deleted: false,
      post: {
        is_deleted: false
      },
      **find_content_params
    }

    contents = get_content_by_criteria(criteria, chunk, offset)

    send_response(contents.as_json(include: :post))
  end

  def create_content

  end

  def deactive_content
    if @content.post[:user_id] != @current_user[:id]
      return forbidden()
    end

    if @content.update(is_deleted: true)
      send_response(@content)
    else
      send_error(@content.errors, :unprocessable_entity)
    end
  end

  private

  def get_content_by_criteria(criteria, chunk, offset)
    contents = Content.includes(:post)
      .where(criteria)
      .order(id: :asc)
      .limit(chunk)
      .offset(offset)
    return contents
  end

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