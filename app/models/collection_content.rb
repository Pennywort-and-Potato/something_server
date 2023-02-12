class CollectionContent < ApplicationRecord
  belongs_to :collection
  belongs_to :post
end
