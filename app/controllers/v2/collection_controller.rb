class V2::CollectionController < ApplicationController
  before_action :set_collection, only: %i[ get_collection_by_id deactive_collection ]

  def get_collection_by_id
    render json: {
      data: @collection.as_json(include: :collection_content),
      success: true
    }, status: :ok
  end

  def get_collection_by
    criteria = {**find_collection_params, is_deleted: false}
    query_limit = get_query_limit(params[:chunk], params[:page])

    collections = get_collection_by_criteria(criteria, query_limit[:chunk], query_limit[:offset])

    send_response(@collection)
  end

  def create_collection
    ActiveRecord::Base.transaction do
      paramx = create_collection_params.merge({user_id: @current_user[:id]})
      collection = Collection.new(paramx)

      params[:post_ids].each do |post_id|
        if !Post.exists?(id: post_id)
          send_error("Post with id:[#{post_id}] not exist", :bad_request)
        end
        collection.collection_content.new(
          post_id: post_id,
          thumbnail: Content.where(post_id: post_id).first.src
        )
      end

      collection[:thumbnail] = Content.where(post_id: params[:post_ids][0]).first.src

      if collection.save
        send_response(collection.as_json(include: :collection_content), :created)
      else
        send_error(collection.errors, :unprocessable_entity)
      end
    end
  end

  def deactive_collection
    if @collection[:user_id] != @current_user[:id]
      return forbidden()
    end

    if @collection.update(is_deleted: true)
      send_response(@collection)
    else
      send_error(@collection.errors, :unprocessable_entity)
    end
  end

  private

    def get_collection_by_criteria(criteria, chunk, offset)
      collections = Collection.where(criteria)
        .order(id: :asc)
        .limit(chunk)
        .offset(offset)
    end

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
