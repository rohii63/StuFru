class HomeController < ApplicationController
  def top
    if user_signed_in?
      @user = current_user
      @micropost = @user.microposts.build()
      @books_select = @user.books.where(status: "勉強中")
      @microposts = @user.feed
      if params[:micropost]
        @micropost_params = params[:micropost]
        @selected_book = Book.find(params[:micropost][:book_id]) if params[:micropost][:book_id].present?
      end
      if params[:modal]
        respond_to do |format|
          format.js { render 'home/open_modal' }
        end
      end
    end
  end
end
