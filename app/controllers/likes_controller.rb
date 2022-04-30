class LikesController < ApplicationController
  def create
    @like= Like.new(params.require(:like).permit(:user_id, :photo_id, :is_like))
    if @like.save
        flash[:success] = "You have liked this photo"
    else
    end
  end

  def destroy
    @like = Like.where(user_id: params[:user_id]).where(photo_id: params[:photo_id]).take
    @user = User.find(params[:photo_id])
    @like.destroy
    flash[:error] = "You have unliked this photo!"
    redirect_to profile_url(email: @user.email)
  end

end


