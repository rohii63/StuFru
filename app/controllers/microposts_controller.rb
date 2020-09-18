class MicropostsController < ApplicationController
  def create
    if params[:page]
      params[:micropost][:study_amount] = params[:page][:end].to_i - params[:page][:start].to_i + 1
      if !params[:page][:start].present?
        params[:micropost][:study_amount] = 10000
      end
    end
    @user = current_user
    @micropost = @user.microposts.build(micropost_params)
    @micropost.save
    @books_in_progress = @user.books.where(status: "勉強中")
    @microposts = @user.feed
  end

  def show
    @micropost = Micropost.find(params[:id])
    if @micropost.user == current_user
      @books_in_progress = current_user.books.where(status: "勉強中")
      if params[:comment_id]
        @comments = @micropost.comments.all
        @comment = Comment.find(params[:comment_id])
        render 'comment_delete_modal'
      end
    end
    @comment = @micropost.comments.build()
    @comments = @micropost.comments.all
    @likes = @micropost.likes.all
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "編集完了"
      redirect_to root_path
    end
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = "削除完了"
    redirect_to root_path
  end

  private

    def micropost_params
      params.require(:micropost).permit(
        :book_id,
        :studied_at,
        :how_many_studied_hours,
        :how_many_studied_minutes,
        :studied_time_in_minutes,
        :studied_page,
        :content,
        :picture,
        :user_id,
        :study_amount
      )
    end
end
