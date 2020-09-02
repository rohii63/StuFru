class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    @micropost = @comment.micropost
    if @comment.save
      @micropost.create_notification_comment!(current_user, @comment.id)
      @comments = @micropost.comments.all
    else
      render 'microposts/show'
    end
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
