class FavoritesController < ApplicationController
    def create
        @favorite= Favorite.new(params.require(:favorite).permit(:user_id, :photo_id, :is_favorite))
        if @favorite.save
            flash[:success] = "You have favorited this photo."
            redirect_to photo_url(Photo.find(params[:photo_id]))
        else
        end
    end
    
    def destroy
        @favorite = Favorite.where(user_id: params[:user_id]).where(photo_id: params[:photo_id]).take
        @favorite.destroy
        flash[:error] = "This photo is removed from favorites!"
        redirect_to photo_url(Photo.find(params[:photo_id]))
    end

    def index
        @user = User.find(params[:user_id])
        if params[:order] == "updated_at"
            @fav_photo_id = Favorite.select(:photo_id).where(user_id: params[:user_id])
            @photos = Photo.where(id: @fav_photo_id).order(created_at: :desc)
        elsif params[:order] == "route_grade"
            @fav_photo_id = Favorite.select(:photo_id).where(user_id: params[:user_id])
            @photos = Photo.where(id: @fav_photo_id).order(:route_grade)
        elsif params[:order] == "route_grade_desc"
            @fav_photo_id = Favorite.select(:photo_id).where(user_id: params[:user_id])
            @photos = Photo.where(id: @fav_photo_id).order(route_grade: :desc)
        elsif params[:order] == "route_location"
            @fav_photo_id = Favorite.select(:photo_id).where(user_id: params[:user_id])
            @photos = Photo.where(id: @fav_photo_id).order(:route_location)
        elsif params[:order] == "route_style"
            @fav_photo_id = Favorite.select(:photo_id).where(user_id: params[:user_id])
            @photos = Photo.where(id: @fav_photo_id).order(:route_style)
        else # Default behavior
            @fav_photo_id = Favorite.select(:photo_id).where(user_id: params[:user_id])
            @photos = Photo.where(id: @fav_photo_id).order(created_at: :desc)
        end

        render :index  
    end
end
