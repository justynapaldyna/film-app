class V2::UsersController < ApplicationController
    def index
        users = User.all 
        render json: users, each_serializer: UserSerializer
    end
end