class BooksController < ApplicationController
  def index
    @user = current_user
    @books = @user.books.all
    @book_categories = @user.book_categories.all
    @book_category = @user.book_categories.build()
    @book = @user.books.build()
    if params[:search] || params[:search] == ""
      @books = Book.name_search(params[:search])
      @keyword = params[:search]
    end
  end

  def create
    @user = current_user
    @book = @user.books.build(book_params)
    attach_default_image unless params[:book][:icon]
    if @book.save
      @user.study_books.create(book_id: @book.id)
      @books = @user.books.all
      @book_categories = @user.book_categories.all
    end
  end

  def show
    @book = Book.find(params[:id])
    @microposts = @book.microposts.all
    @user = current_user
    @book_categories = @user.book_categories.all
    respond_to do |format|
      format.html
      format.js { render 'edit' }
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "編集完了"
      redirect_to books_path()
    end
    @user = current_user
    @book_categories = @user.book_categories.all
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "削除完了"
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:name, :icon, :status, :study_unit, :book_category_id)
    end

    def attach_default_image
      @book.icon.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'book-icon-default-image.png')), filename: 'book-icon-default-image.png', content_type: 'image/png')
    end
end
