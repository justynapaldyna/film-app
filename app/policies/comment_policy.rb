class CommentPolicy < ApplicationPolicy

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index?
  end

  def show?
  end

  def create?
  end

  def new?
    create?
  end
  
  def update?
    comment.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    @comment.user_id == @user.id
  end
end