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
        format.html { redirect_to admin_users_path, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :about_me, :avatar, :email, :password, :status )
  end

end
