class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @micropost = @comment.micropost
    @micropost.create_notification_comment!(current_user, @comment.id) if @comment.save
    @comments = @micropost.comments.all
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    Comment.find(params[:id]).destroy
    @comments = @micropost.comments.all
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :micropost_id)
  end
end
