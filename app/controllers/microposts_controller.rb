class MicropostsController < ApplicationController
  def create
    if params[:page]
      start_page = params[:page][:start].to_i
      end_page = params[:page][:end].to_i
      if start_page == 0 || end_page == 0
        tmp = nil
      elsif start_page >= end_page
        tmp = 10000
      else
        tmp = end_page - start_page
      end
      params[:micropost][:study_amount] = tmp
    end
    @user = current_user
    @micropost = @user.microposts.build(micropost_params)
    @micropost.save
    @books_in_progress = @user.books_in_progress
    @microposts = @user.feed
  end

  def show
    @micropost = Micropost.find(params[:id])
    if @micropost.user == current_user
      @books_in_progress = current_user.books_in_progress
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
    @micropost.study_amount = nil unless params[:micropost][:study_amount].present?
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
        :study_amount,
        :status_with_book_id
      )
    end
end
