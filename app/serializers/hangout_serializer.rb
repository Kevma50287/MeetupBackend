class HangoutSerializer < ActiveModel::Serializer
  attributes :id, :host, :participants, :title, :what, :why, :location, :date
end
