class PhotosController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, except: [:index, :new, :create, :show, :create_like, :edit, :update, :destroy, :create_favorite]

    def require_permission
        if Photo.find(params[:id]).creator != current_user
          redirect_to photos_path, flash: { error: "You do not have permission to do that." }
        end
    end

    def show
        @photo = Photo.find(params[:id])
        @comments = @photo.comments.order(created_at: :desc)
        @comment = Comment.new
        @favorite = Favorite.new
        @like = Like.new
        render :show
    end

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
            elsif params[:order] == "route_grade_desc"
                @photos = @user.photos.order(route_grade: :desc)
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

    def edit
        @photo = Photo.find(params[:id])
        render :edit
    end

    def update
        @photo = Photo.find(params[:id])
        if @photo.update(params.require(:photo).permit(:route_title, :route_grade, :route_location, :route_description, :route_style, :route_image))
          flash[:success] = "Photo successfully updated!"
          redirect_to profile_path(email: current_user.email)
        else
          flash.now[:error] = "Photo update failed"
          render :edit
        end
      end

    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy
        flash[:success] = "The photo was successfully destroyed."
        redirect_to profile_path(email: current_user.email)
    end
    
    
    def create_like
        is_like = params[:is_like]
        if is_like == "0"
          is_like = false
        elsif is_like == "1"
          is_like = true
        end
        like = Like.find_or_create_by(is_like:is_like)
        like.save
    end

    def create_favorite
        is_favorite = params[:is_favorite]
        if is_favorite == "0"
          is_favorite = false
        elsif is_favorite == "1"
          is_favorite = true
        end
        favorite = Favorite.find_or_create_by(is_favorite:is_favorite)
        favorite.save
    end
   
end
