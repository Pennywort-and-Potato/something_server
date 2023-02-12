class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :post_id
end
