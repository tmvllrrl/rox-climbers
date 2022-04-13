class FollowsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @type = params[:type]

        if @type == "followers" # Want to view the users' followers
            @follows = Follow.where(follow_id: @user.id)
        else # Want to view who the user is following
            @follows = Follow.where(user_id: @user.id)
        end

        render :index
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
