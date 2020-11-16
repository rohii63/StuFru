class BooksController < ApplicationController
  def index
    @user = current_user
    @book = @user.books.build()
    @status_with_books = @user.status_with_books.all
    @status_with_book = @user.status_with_books.build()
    @book_categories = @user.book_categories.all
    @book_category = @user.book_categories.build()
    if params[:search] || params[:search] == ""
      @books = Book.name_search(params[:search])
      @keyword = params[:search]
    end
  end

  def create
    @user = current_user
    @book = @user.books.build(book_params)
    @status_with_book = @user.status_with_books.build(status_with_book_params)
    attach_default_image unless params[:book][:icon]
    if @book.save
      @status_with_book.book_id = @book.id
      if @status_with_book.save
        @user.study_books.create(book_id: @book.id)
        @books = @user.books.all
        @book_categories = @user.book_categories.all
        @status_with_books = @user.status_with_books.all
      end
    end
  end

  def show
    @book = Book.find(params[:id])
    @microposts = @book.microposts.all
    @user = current_user
    @study_book = @user.study_books.build(book_id: @book.id)
    @status_with_book = @user.status_with_books.build()
    @book_categories = @user.book_categories.all

    respond_to do |format|
      format.html
      format.js { render 'edit' }
    end

  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  end

  def destroy
  end

  private

    def book_params
      params.require(:book).permit(:name, :icon, :status, :study_unit)
    end

    def status_with_book_params
      params.require(:status_with_book).permit(:status, :study_unit, :book_category_id)
    end

    def attach_default_image
      @book.icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'book-default-image.png')), filename: 'book-default-image.png', content_type: 'image/png')
    end
end
