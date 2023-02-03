class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :view, :like, :dislike, :rating, :user_id
end
