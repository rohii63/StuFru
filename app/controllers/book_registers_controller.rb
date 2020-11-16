class BookRegistersController < ApplicationController
  def create
    @user = current_user
    @book = Book.find(params[:book_register][:book_id])
    @status_with_book = @user.status_with_books.build(status_with_book_params)
    @status_with_book.book_id = @book.id
    current_user.register(@book)
    @status_with_book.save
    flash[:notice] = "登録完了"
    redirect_to user_books_path(@user)
  end

  def destroy
    @user = current_user
    @book = Book.find(params[:id])
    current_user.unregister(@book)
    @user.status_with_books.find_by(book_id: @book.id).destroy
    @study_book = @user.study_books.build(book_id: @book.id)
    @status_with_book = @user.status_with_books.build()
    @book_categories = @user.book_categories.all
  end

  private

    def status_with_book_params
      params.require(:status_with_book).permit(:status, :study_unit, :book_category_id)
    end

end
