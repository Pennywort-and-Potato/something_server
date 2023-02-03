class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show update destroy ]

  # GET /contents
  def index
    @contents = Content.all

    render json: @contents
  end

  # GET /contents/1
  def show
    render json: @content
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
      render json: @content, status: :created
    else
      render json: {error: @content.errors, detail: "Create post content fails, please try again!"}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contents/1
  def update
    if @content.update(content_params)
      render json: @content
    else
      render json: {error: @content.errors, detail: "Update post content fails, please try again!"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.permit(:alt, :src, :content_type)
    end
end
