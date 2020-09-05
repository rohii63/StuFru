class MicropostsController < ApplicationController
  def create
    @user = current_user
    @micropost = @user.microposts.build(micropost_params)
    @micropost.save
    @books = @user.books.all
    @book_names = @books.pluck(:name)
    @microposts = @user.feed
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.build()
    @comments = @micropost.comments.all
    @likes = @micropost.likes.all
    if @micropost.user == current_user
      @books = current_user.books.all
      @book_names = @books.pluck(:name)
      @comment_id = Comment.find(params[:comment][:id]) if request.xml_http_request?
    end
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "編集完了"
      redirect_to micropost_path(@micropost)
    else
      @books = current_user.books.all
      @book_names = @books.pluck(:name)
      @comment = @micropost.comments.build()
      @comments = @micropost.comments.all
      @likes = @micropost.likes.all
      render 'show'
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
        :user_id
      )
    end
end
