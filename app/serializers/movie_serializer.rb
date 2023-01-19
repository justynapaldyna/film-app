class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year
  has_many :comments
end
