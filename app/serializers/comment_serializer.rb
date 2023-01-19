class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :movie
  belongs_to :user
end
