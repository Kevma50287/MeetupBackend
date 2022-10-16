class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :full_name, :password_digest, :location, :gender, :age, :online_status, :last_online
end
