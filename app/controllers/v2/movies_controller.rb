class V2::MoviesController < ApplicationController
   
  def index
    movies = Movie.all
    render json: movies, each_serializer: MovieSerializer
  end
  
end
  