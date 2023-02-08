class Content < ApplicationRecord
  belongs_to :post

  validates :src, presence: true
  validates :content_type, presence: true
end
