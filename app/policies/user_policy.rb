class UserPolicy < ApplicationPolicy
    
    def index?
      user.admin?
    end
  
    def show?
      # binding.pry
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
      user.admin? 
    end
  
    def destroy?
      user.admin?
    end


    class Scope < Scope
        def resolve
          if user.admin?
            scope.all
          else
            scope.none
          end
        end
    end
end