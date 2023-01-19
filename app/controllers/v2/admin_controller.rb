class V2::AdminController < ApplicationController
  
    def users
      users = User.all
      render json: users
    end

    def movies 
      movies = Movie.all 
      render json: movies
end
  
    