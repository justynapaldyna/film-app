class CategoryPolicy < ApplicationPolicy
    attr_reader :user, :category
  
    def initialize(user, category)
      @user = user
      @category = category
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