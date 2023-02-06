class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show update destroy ]
  before_action :grant_admin_permission, only: %i[ index ]

  # GET /contents
  def index
    @contents = Content.all

    render json: {
      data: @contents,
      success: true
    },
    status: :ok
  end

  # GET /contents/1
  def show
    render json: {
      data: @content,
      success: true
    },
    status: :ok
  end

  # POST /contents
  def create
    @content = Post.find(params[:post_id]).content.new(
      alt: content_params[:alt],
      src: content_params[:src],
      content_type: content_params[:content_type],
      post_id: params[:post_id]
    )

    if @content.save
      render json: {
        data: @content
        success: true
      }, status: :created
    else
      render json: {
        error: @content.errors,
        success: false
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contents/1
  def update
    if @content.post[:user_id] != @current_user[:id] && !is_admin(@current_user)
      return render json: {
        error: "You dont have permission to access this resources",
        success: false
      },
      status: :forbidden
    end

    if @content.update(content_params)
      render json: {
        data: @content,
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
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])

      if @content[:is_deleted] && !is_admin(@current_user)
        return render json: {
          error: "Post not exist",
          success: false
        },
        status: :not_found
      end

      rescue ActiveRecord::RecordNotFound
        return render json: {
          error: "Post not exist",
          success: false
        },
        status: :not_found
    end

    def content_params
      params.permit(:alt, :src, :content_type)
    end
end
