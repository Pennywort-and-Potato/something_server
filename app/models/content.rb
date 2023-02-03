class Content < ApplicationRecord
  belongs_to :post

  validates :src, presence: true, uniqueness: true
  validates :content_type, presence: true
end
