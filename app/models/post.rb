class Post < ApplicationRecord
   belongs_to :user

   has_many :content
   has_many :collection_content, dependent: :delete_all
end
