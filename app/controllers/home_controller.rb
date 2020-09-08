class HomeController < ApplicationController
  def top
    if user_signed_in?
      @user = current_user
      @micropost = @user.microposts.build()
      @books = @user.books.all
      @book_names = @books.pluck(:name)
      @microposts = @user.feed
    end
  end
end
