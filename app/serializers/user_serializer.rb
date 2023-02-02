class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :date_of_birth, :email, :role, :is_deleted, :password_digest
end
