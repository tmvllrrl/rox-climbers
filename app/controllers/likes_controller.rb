class LikesController < ApplicationController
    def create
        @photo = Photo.find(params[:photo_id])
        is_like = params[:is_like]
        if is_like == "0"
          is_like = false
        elsif is_like == "1"
          is_like = true
        end
        @like = @photo.likes.build(params.permit(:like, :is_like))
        @like.save
    end
end
