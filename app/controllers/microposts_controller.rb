class MicropostsController < ApplicationController
  def create
    culculate_study_amount_of_page
    @user = current_user
    @micropost = @user.microposts.build(micropost_params)
    @micropost.save
    @books_in_progress = @user.books_in_progress
    @microposts = @user.feed
  end

  def show
    @micropost = Micropost.find(params[:id])
    @books_in_progress = current_user.books_in_progress if @micropost.user == current_user
    @comment = @micropost.comments.build
    @comments = @micropost.comments.all
    @likes = @micropost.likes.all
    return unless params[:comment_id]

    @comment = Comment.find(params[:comment_id])
    render 'comment_delete_modal'
  end

  def edit
    @micropost = Micropost.find(params[:id])
    render 'modal' if params[:modal]
  end

  def update
    culculate_study_amount_of_page
    @micropost = Micropost.find(params[:id])
    return unless @micropost.update(micropost_params)

    flash[:notice] = '編集完了'
    redirect_to root_path
  end

  def destroy
    Micropost.find(params[:id]).destroy
    flash[:notice] = '削除完了'
    redirect_to root_path
  end

  private

  def micropost_params
    params.require(:micropost).permit(
      :book_id,
      :studied_at,
      :study_hours,
      :study_minutes,
      :study_time,
      :studied_page,
      :content,
      :picture,
      :user_id,
      :study_amount,
      :study_unit
    )
  end

  def culculate_study_amount_of_page
    return unless params[:page]

    start_page = params[:page][:start].to_i
    end_page = params[:page][:end].to_i

    tmp = if start_page.zero? || end_page.zero?
            10000
          elsif start_page >= end_page
            10001
          else
            end_page - start_page
          end
    params[:micropost][:study_amount] = tmp
  end
end
