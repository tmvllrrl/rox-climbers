class PhotosController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        @photos = Photo.order(:updated_at)
        render :index
    end

    def new
        @photo = Photo.new
        render :new
    end

    def create
        @photo = Photo.new(params.require(:photo).permit(:route_title, :route_grade, :route_location, :route_description, :route_style, :route_image))
        if @photo.save
            flash[:success] = "Photo Uploaded Succesfully!"
            redirect_to photos_url
        else
            flash.now[:error] = "Photo Upload Failed"
            render :new
        end
    end
end
