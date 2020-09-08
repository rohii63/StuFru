class BooksController < ApplicationController
  def index
    @user = current_user
    @book = @user.books.build
    if params[:search] || params[:search] == ""
      @books = Book.name_search(params[:search])
      @keyword = params[:search]
    else
      @books = @user.books.all
    end
  end

  def create
    @book = current_user.books.build(book_params) 
    attach_default_image unless params[:book][:icon]
    if @book.save
      current_user.study_books.create(book_id: @book.id)
    end
    @books = current_user.books.all
  end

  def show
    @book = Book.find(params[:id])
    @microposts = @book.microposts.all
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "削除完了"
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:name, :icon)
    end

    def attach_default_image
      @book.icon.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'book-icon-default-image.png')), filename: 'book-icon-default-image.png', content_type: 'image/png')
    end
end
