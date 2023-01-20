class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year
  has_many :comments
  belongs_to :category
end
