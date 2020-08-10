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
  end

  def edit
  end

  def update
  end

  def destroy
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
