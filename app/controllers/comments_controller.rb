class CommentsController < ApplicationController

    def index
        @photo = Photo.find(params[:photo_id])
        @comments = @photo.comments
        render :index
    end

    def new
        @photo = Photo.find(params[:photo_id])
        @comment = Comment.new
        render :new
    end

    def create
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.build(params.require(:comment).permit(:comment, :text, :user_id))
        if @comment.save
          # flash[:success] = "Comment saved successfully"
          redirect_to photo_url(@photo)
        else
          flash.now[:error] = "Comment could not be saved"
          render :new
        end
    end

end
