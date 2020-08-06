class BooksController < ApplicationController
  require 'pry'

  def new
    @user = current_user
    @book = @user.books.build
    @userBooks = @user.books.all
    @books = Book.all
  end

  def create
    @book = current_user.books.build(book_params) 
    attach_default_image unless params[:book][:icon]
    if @book.save
      flash[:success] = "Book created!"
      redirect_to new_user_book_path(current_user)
    else
      flash.now[:error] = "教材名を入力してください"
      redirect_to request.referrer
    end
  end

  def edit
  end

  def update
  end

  private

    def book_params
      params.require(:book).permit(:name, :icon)
    end

    def attach_default_image
      @book.icon.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'book-icon-default-image.png')), filename: 'book-icon-default-image.png', content_type: 'image/png')
    end
end
