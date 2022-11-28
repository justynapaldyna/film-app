class CommentsController < ApplicationController
    before_action :set_comment, only: [ :show, :edit, :update, :destroy ]
    before_action :authenticate_user!, only: [ :create, :update, :destroy ]
    def index
        @comments = Comment.all 
    end

    def show
    end

    def new
        @comment = Comment.new 
    end

    def edit
    end

    def create
        @comment = Comment.new(comment_params.merge( user: current_user )) 

        respond_to do |format|
            if @comment.save
              format.html { redirect_to movie_path(params[:movie_id]), notice: "Comment was successfully created." }
            else
              format.html { render ("movies/show"), status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @comment.update(comment_params)
              format.html { redirect_to movie_path(params[:movie_id]), notice: "Comment was successfully updated." }
            else
              format.html { render ("movies/show"), status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @comment.destroy

        respond_to do |format|
            format.html { redirect_to movies_path, notice: "Comment was successfully destroyed." }
        end
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body, :user_id, :movie_id ).merge(movie_id: params[:movie_id])
    end

end
