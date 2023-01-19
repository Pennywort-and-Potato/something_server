class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :name, :email, :role
end
