class FollowsController < ApplicationController

    def index
        
    end


    def create
        @follow = Follow.new(params.require(:follow).permit(:user_id, :follow_id))
        @user = User.find(@follow.follow_id)
        if @follow.save
            flash[:success] = "You have followed this user"
            redirect_to profile_url(email: @user.email)
        else

        end
    end

    def destroy
        @follow = Follow.where(user_id: params[:user_id]).where(follow_id: params[:follow_id]).take
        @user = User.find(params[:follow_id])
        @follow.destroy
        flash[:error] = "You have unfollowed this person!"
        redirect_to profile_url(email: @user.email)
    end
end
