class V2::CollectionController < ApplicationController
  before_action :set_collection, only: %i[ get_collection_by_id deactive_collection ]

  def get_collection_by_id
    render json: {
      data: @collection.as_json(include: :collection_content),
      success: true
    }, status: :ok
  end

  def get_collection_by

    chunk = params[:chunk] || 30
    page = params[:page] && params[:page] - 1 || 0
    offset = page * chunk

    collections = Collection.where(find_collection_params)
                            .order(id: :asc)
                            .limit(chunk)
                            .offset(offset)

    render json: {
      data: @collection,
      success: true
    }, status: :ok
  end

  def create_collection

    paramx = create_collection_params.merge({user_id: @current_user[:id]})
    collection = Collection.new(paramx)

    params[:post_ids].each do |post_id|
      if !Post.exists?(id: post_id)
        render json: {
          error: "Post with id:[#{post_id}] not exist",
          success: false
        }, status: :bad_request
      end
      collection.collection_content.new(
        post_id: post_id,
        thumbnail: Content.where(post_id: post_id).first.src
      )
    end

    collection[:thumbnail] = Content.where(post_id: params[:post_ids][0]).first.src

    if collection.save
      render json: {
        data: collection.as_json(include: :collection_content),
        success: true
      }, status: :ok
    else
      render json: {
        error: collection.errors,
        success: false
      }, status: :unprocessable_entity
    end

  end

  def deactive_collection
    if @collection[:user_id] != @current_user[:id]
      return forbidden()
    end

    if @collection.update(is_deleted: true)
      render json: {
        data: @collection,
        success: true
      }, status: :ok
    else
      render json: {
        error: @collection.error,
        success: false
      }, status: :unprocessable_entity
    end
  end

  private

    def set_collection
      @collection = Collection.find(params[:id])

      if @collection[:is_deleted] || @collection.user[:is_deleted]
        return not_found("Collection")
      end
      rescue ActiveRecord::RecordNotFound
        return not_found("Collection")
    end

    def find_collection_params
      params.permit(:id, :name, :user_id, :post_id)
    end

    def create_collection_params
      params.permit(:name, :is_private)
    end
end
