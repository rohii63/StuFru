class BookRegistersController < ApplicationController
  def create
    book = Book.find(params[:book_register][:book_id])
    current_user.register(book)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    current_user.unregister(book)
    redirect_to book_path(book)
  end
end
