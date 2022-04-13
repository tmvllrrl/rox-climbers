class ProfilesController < ApplicationController
    def show
        @user = User.find_by email: params[:email]
        @photos = @user.photos.order(created_at: :desc)
        render :profile
    end

end
