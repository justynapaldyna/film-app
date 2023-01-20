class V2::AdminController < ApplicationController
  
  def users
    users = User.all
    render json: users, each_serializer: UserAdminSerializer
  end

  def movies 
    movies = Movie.all 
    render json: movies, each_serializer: MovieAdminSerializer
  end
end
  
    