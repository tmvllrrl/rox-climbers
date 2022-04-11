class PhotosController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        if user_signed_in? # If the user is signed in, then display their photos
            @photos = current_user.photos.order(:updated_at)
            render :index
        else # If the user is not signed in, then display a "home page" user's photos
            @user = User.find(1)
            @photos = @user.photos.order(:updated_at)
            render :index
        end
        
    end

    def new
        @photo = Photo.new
        render :new
    end

    def create
        @photo = current_user.photos.build(params.require(:photo).permit(:route_title, :route_grade, :route_location, :route_description, :route_style, :route_image))
        if @photo.save
            flash[:success] = "Photo Uploaded Succesfully!"
            redirect_to photos_url
        else
            flash.now[:error] = "Photo Upload Failed"
            render :new
        end
    end
end
