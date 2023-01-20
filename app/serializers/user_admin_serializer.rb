class UserAdminSerializer < ActiveModel::Serializer
  attributes :id, :login, :about_me, :email
  has_many :comments
end
