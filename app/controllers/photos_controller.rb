class PhotosController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        if user_signed_in? # If the user is signed in, then display the photos of who they follow
            if params[:order] == "updated_at"
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
