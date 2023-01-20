class MovieAdminSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :description, :movie_length, :string, :director, :language, :rating
  has_many :comments
end
