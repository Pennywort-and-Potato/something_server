class Tag < ApplicationRecord
  has_many :post_tags

  validates :tag, uniqueness: true
end
