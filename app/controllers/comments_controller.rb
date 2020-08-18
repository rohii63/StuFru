class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    @micropost = @comment.micropost
    if @comment.save
      @micropost.create_notification_comment!(current_user, @comment.id)
      redirect_to micropost_path(@micropost)
    else
      render 'microposts/show'
    end
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    Comment.find(params[:id]).destroy
    redirect_to micropost_path(micropost)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :micropost_id)
    end
end
