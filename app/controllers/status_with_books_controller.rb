class StatusWithBooksController < ApplicationController
  def edit
    @user = current_user
    @status_with_book = StatusWithBook.find(params[:id])
    @book_categories = @user.book_categories.all

    @status = ''
    @study_unit = ''

    StatusWithBook.statuses.each do |status|
      @status = status[1] if @status_with_book.status == status[0]
    end

    StatusWithBook.study_units.each do |study_unit|
      @study_unit = study_unit[1] if @status_with_book.study_unit == study_unit[0]
    end
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
