class MicropostsController < ApplicationController
  def new
    @user = current_user
    @micropost = @user.microposts.build()
    @books = @user.books.all
    @book_names = @books.pluck(:name)
  end

  def create
    @user = current_user
    @micropost = @user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "登録完了"
      redirect_to root_path
    else
      @books = @user.books.all
      @book_names = @books.pluck(:name)
      render 'new'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.build()
    @comments = @micropost.comments.all
    @likes = @micropost.likes.all
  end

  def edit
    @micropost = Micropost.find(params[:id])
    @user = current_user
    @books = @user.books.all
    @book_names = @books.pluck(:name)
  end

  def update
    @user = current_user
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "編集完了"
      redirect_to root_path
    else
      @books = @user.books.all
      @book_names = @books.pluck(:name)
      render 'edit'
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
