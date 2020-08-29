class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.likes.create(micropost_id: @micropost.id)
    @micropost.create_notification_like!(current_user)
  end

  def destroy
    Like.find(params[:id]).destroy
    @micropost = Micropost.find(params[:micropost_id])
  end
end
