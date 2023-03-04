require 'active_record/errors'
class V2::AdminController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  def users
    users = User.all
    render json: users, each_serializer: UserAdminSerializer
  end

  def movies 
    movies = Movie.all 
    render json: movies, each_serializer: MovieAdminSerializer
  end
 
end
  
    