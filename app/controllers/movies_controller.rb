class MoviesController < ApplicationController
  before_action :set_movie, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]
  before_action :set_categories, only: [:new, :create, :edit]

  def index
    @movies = Movie.all
  end

  def show
    @comment = @movie.comments.build
  end

  def new
    @movie = Movie.new
  end

  def edit
    authorize @movie
  end

  def create
    authorize @movie
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @movie
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @movie
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_categories
    @categories = Category.all.order(:name)
  end 

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :year, :description, :movie_length, :string, :director, :language, :rating, :category_id, :user_id, :image )
  end
end
