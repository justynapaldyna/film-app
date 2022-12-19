class AdminController < ApplicationController
  before_action :authenticate_user!

  def users
    @users = User.all
    authorize @users, :index?
  end

  def movies
    @movies = Movie.all
    authorize @movies, :index?
  end

  def show_user
    @user = User.find(params[:id])
    authorize @user, :show?
  end

  def edit_user
    @user = User.find(params[:id])
    authorize @user, :edit?
  end

  def update_user
    @user = User.find(params[:id])
    authorize @user, :update?
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: "User was successfully updated." }
      else
        format.html { render ("movies/show"), status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :about_me, :avatar, :email, :password, :status )
  end

end
