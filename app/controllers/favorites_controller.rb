class FavoritesController < ApplicationController
    def create
        @favorite= Favorite.new(params.require(:favorite).permit(:user_id, :photo_id, :is_favorite))
        if @favorite.save
            flash[:success] = "You have marked this phots as favorite"
            redirect_to photo_url(Photo.find(params[:photo_id]))
        else
        end
    end
    
    def destroy
        @favorite = Favorite.where(user_id: params[:user_id]).where(photo_id: params[:photo_id]).take
        @favorite.destroy
        flash[:error] = "This photo is removed from favorite!"
        redirect_to photo_url(Photo.find(params[:photo_id]))
    end
end
