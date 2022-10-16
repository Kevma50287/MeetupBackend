class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text
  has_one :chat
  has_one :user
end
