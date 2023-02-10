class V2::CommentsController < ApplicationController
    
    def index 
        comments = Comment.all 
        render json: comments, each_serializer: CommentSerializer
    end
end