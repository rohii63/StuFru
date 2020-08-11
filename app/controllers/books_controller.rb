class BooksController < ApplicationController
  def new
    @user = current_user
    @book = @user.books.build
    @books = !params[:search].present? ? @user.books.all : Book.name_search(params[:search])
    @keyword = params[:search]
  end

  def create
    @book = current_user.books.build(book_params) 
    attach_default_image unless params[:book][:icon]
    if @book.save
      current_user.study_books.create(book_id: @book.id)
      flash[:success] = "登録完了"
      redirect_to new_book_path
    elsif @book.exist_same_name?
      flash[:error] = "同じ教材名が既に存在します"
      redirect_to request.referrer
    else
      flash[:error] = "教材名を入力してください"
      redirect_to request.referrer
    end
  end

  def edit
    @book = Book.find(params[:id])
    @microposts = @book.microposts.all
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = "編集完了"
      redirect_to edit_book_path(book)
    elsif @book.exist_same_name?
      flash[:error] = "同じ教材名が既に存在します"
      redirect_to request.referrer
    else
      flash[:error] = "教材名を入力してください"
      redirect_to request.referrer
    end
  end

  private

    def book_params
      params.require(:book).permit(:name, :icon)
    end

    def attach_default_image
      @book.icon.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'book-icon-default-image.png')), filename: 'book-icon-default-image.png', content_type: 'image/png')
    end
end
