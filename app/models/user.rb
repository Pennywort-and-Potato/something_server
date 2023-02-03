class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, presence: true

  has_many :post, dependent: :nullify
end
