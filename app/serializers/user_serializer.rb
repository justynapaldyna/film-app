class UserSerializer < ActiveModel::Serializer
  attributes :id, :login
  has_many :comments
end
