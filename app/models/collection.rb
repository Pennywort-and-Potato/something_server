class Collection < ApplicationRecord
  belongs_to :user

  has_many :collection_content, dependent: :delete_all
end
