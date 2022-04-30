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

    def index
        if user_signed_in? 
            if params[:order] == "updated_at"
            #    @fav_photo_id = Favorite.select(:photo_id).where(user_id: current_user.id)
            #    @photos = Photo.where(photo_id: @fav_photo_id).order(created_at: :desc)


                @follows = Follow.select(:follow_id).where(user_id: current_user.id)
                @photos = Photo.where(user_id: @follows).order(created_at: :desc)
            elsif params[:order] == "route_grade"
                @follows = Follow.select(:follow_id).where(user_id: current_user.id)
                @photos = Photo.where(user_id: @follows).order(:route_grade)
            elsif params[:order] == "route_grade_desc"
                @follows = Follow.select(:follow_id).where(user_id: current_user.id)
                @photos = Photo.where(user_id: @follows).order(route_grade: :desc)
            elsif params[:order] == "route_location"
                @follows = Follow.select(:follow_id).where(user_id: current_user.id)
                @photos = Photo.where(user_id: @follows).order(:route_location)
            elsif params[:order] == "route_style"
                @follows = Follow.select(:follow_id).where(user_id: current_user.id)
                @photos = Photo.where(user_id: @follows).order(:route_style)
            else # Default behavior
                @follows = Follow.select(:follow_id).where(user_id: current_user.id)
                @photos = Photo.where(user_id: @follows).order(created_at: :desc)
            end

            render :index
        
        end
    end


end
