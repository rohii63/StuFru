class LikesController < ApplicationController
  def create
    current_user.likes.create(micropost_id: params[:micropost_id])
    redirect_to request.referrer
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to request.referrer
  end
end
