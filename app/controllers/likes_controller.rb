class LikesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.likes.create(micropost_id: micropost.id)
    micropost.create_notification_like!(current_user)
    redirect_to request.referrer
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to request.referrer
  end
end
