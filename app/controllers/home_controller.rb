class HomeController < ApplicationController
  def top
    if user_signed_in?
      if params[:modal]
        render 'modal_open'
      elsif params[:micropost]
        @selected_book = Book.find(params[:micropost][:book_id]) if params[:micropost][:book_id].present?
        render 'modal'
      end
      @user = current_user
      @micropost = @user.microposts.build()
      @books_in_progress = @user.books.where(status: "勉強中")
      @microposts = @user.feed
    end
  end
end
