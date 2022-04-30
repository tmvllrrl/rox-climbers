class ProfilesController < ApplicationController
    def show
        @user = User.find_by email: params[:email]
        @photos = @user.photos.order(created_at: :desc)
        @follow = Follow.new
        @like = Like.new
        render :profile
    end

end
