class ExploresController < ApplicationController
    #before_action :authenticate_user!, except: [:index]

    def index

        if params[:query] == nil
            @user = User.select(:id).order(Arel.sql('RANDOM()')).first(3)

            if params[:order] == "updated_at"
                @photos = Photo.where(user_id: @user).order(created_at: :desc)
            elsif params[:order] == "route_grade"
                @photos = Photo.where(user_id: @user).order(:route_grade)
            elsif params[:order] == "route_grade_desc"
                @photos = Photo.where(user_id: @user).order(route_grade: :desc)
            elsif params[:order] == "route_location"
                @photos = Photo.where(user_id: @user).order(:route_location)
            elsif params[:order] == "route_style"
                @photos = Photo.where(user_id: @user).order(:route_style)
            else # Default behavior
                @photos = Photo.where(user_id: @user).order(created_at: :desc)
            end

            @query = nil
        else
            @photos = Photo.search(params[:query]).records
            @query = params[:query]
        end
        
        
        

        render :index
        
    end

end
