class CommentPolicy < ApplicationPolicy
    def index?
    end
  
    def show?
    end
  
    def create?
      user.admin?
    end
  
    def new?
      create?
    end
  
    def update?
      record.user_id == user.id
    end
  
    def edit?
      update?
    end
  
    def destroy?
      record.user_id == user.id || user.admin?
    end
end