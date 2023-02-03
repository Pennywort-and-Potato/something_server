class ContentSerializer < ActiveModel::Serializer
  attributes :id, :alt, :src, :content_type, :view, :like, :dislike, :rating, :post_id
end
