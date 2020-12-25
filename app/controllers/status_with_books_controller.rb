class StatusWithBooksController < ApplicationController
  def edit
    @user = current_user
    @status_with_book = StatusWithBook.find(params[:id])
    @book_categories = @user.book_categories.all
  end

  def update
    @user = current_user
    @status_with_book = StatusWithBook.find(params[:id])
    @status_with_book.update(status_with_book_params)
    flash[:notice] = 'ステータス編集完了'
    redirect_to user_books_path(@user)
  end

  private

  def status_with_book_params
    params.require(:status_with_book).permit(:status, :study_unit, :book_category_id)
  end
end
