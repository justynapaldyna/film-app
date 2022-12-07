class CommentPolicy < ApplicationPolicy
    attr_reader :user, :comment
  
    def initialize(user, comment)
      @user = user
      @comment = comment
    end
  
    def index?
      user.admin?
    end
  
    def show?
      user.admin?
    end
  
    def create?
      user.admin?
    end
  
    def new?
      create?
    end
  
    def update?
      user.admin?
    end
  
    def edit?
      update?
    end
  
    def destroy?
      user.admin?
    end
  end