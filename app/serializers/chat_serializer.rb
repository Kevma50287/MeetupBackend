class ChatSerializer < ActiveModel::Serializer
  attributes :id, :title, :last_message, :last_user
  has_many :messages
end
