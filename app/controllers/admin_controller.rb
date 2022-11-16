class AdminController < ApplicationController
  def index
  end

  def users
    @users = User.all
  end

  def movies
    @movies = Movie.all
  end

  def show_movie
    @movie = Movie.find(params[:id])
  end

  def show_user
    @user = User.find(params[:id])
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
end
