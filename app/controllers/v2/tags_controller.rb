class V2::TagController < ApplicationController
  # before_action :set_tag, only: %i[ show update destroy ]
  before_action :authenticate_request

  def create_tag
    tag = Tag.new(create_tag_params)

    if tag.save
      render json: {
        data: tag,
        success: true
      }, status: :ok
    else
      render json: {
        error: post.errors,
        success: false
      },
      status: :unprocessable_entity
    end
  end

  def get_tag
    return render json: {
      data: @tag,
      success: true
    }, status: :ok
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])

      if @tag[:is_deleted]
        return not_found("Tag")
      end
      
      rescue ActiveRecord::RecordNotFound
        return not_found("Tag")
    end

    def create_tag_params
      params.permit(:tag, :description)
    end
end
