class PhotosController < ApplicationController

    def index
        @photos = Photo.order(:updated_at)
        render :index
    end

end
