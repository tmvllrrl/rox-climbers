class PhotosController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        if user_signed_in? # If the user is signed in, then display their photos
            if params[:order] == "updated_at"
                @photos = current_user.photos.order(created_at: :desc)
            elsif params[:order] == "route_grade"
                @photos = current_user.photos.order(:route_grade)
            elsif params[:order] == "route_location"
                @photos = current_user.photos.order(:route_location)
            elsif params[:order] == "route_style"
                @photos = current_user.photos.order(:route_style)
            else # Default behavior
                @photos = current_user.photos.order(created_at: :desc)
            end
            render :index
        else # If the user is not signed in, then display a "home page" user's photos
            @user = User.find(1)

            if params[:order] == "updated_at"
                @photos = @user.photos.order(created_at: :desc)
            elsif params[:order] == "route_grade"
                @photos = @user.photos.order(:route_grade)
            elsif params[:order] == "route_location"
                @photos = @user.photos.order(:route_location)
            elsif params[:order] == "route_style"
                @photos = @user.photos.order(:route_style)
            else # Default behavior
                @photos = @user.photos.order(created_at: :desc)
            end
            render :index
        end
    end

    def index_sort_grade
        if user_signed_in? # If the user is signed in, then display their photos
            @photos = current_user.photos.order(:route_grade)
            render :index
        else # If the user is not signed in, then display a "home page" user's photos
            @user = User.find(1)
            @photos = @user.photos.order(:route_grade)
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
