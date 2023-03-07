require 'active_record/errors'
class V2::AdminController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def users
    users = User.all 
    render json: users, each_serializer: UserAdminSerializer
  end

  def movies 
    movies = Movie.all 
    render json: movies, each_serializer: MovieAdminSerializer
  end

  def show_user
    user = User.find(params[:id]) 
    render json: user
    
  end

  def not_found
    render json: { error: "User not found" }, status: :not_found
  end
 
end
  
    