class User < ApplicationRecord
  has_secure_password
  validates :username, :presence =>  {:message => "Username can't be blank"}
  validates :username, :uniqueness => {:message => "Username has been taken"}
  validates :username, :format => { :with => /\A[a-zA-Z0-9]+\Z/ , :message => "Invalid username"}
  validates :email, :presence => {:message => "Email can't be blank"}
  validates :email, :uniqueness => {:message => "Email has been taken"}
  validates :email, :format => { with: URI::MailTo::EMAIL_REGEXP, :message => "Invalid email" } 
  # validates :password, presence: true

  has_many :post, dependent: :nullify
  has_many :collection
  has_many :user_notification
end
