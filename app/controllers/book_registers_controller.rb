class BookRegistersController < ApplicationController
  def create
    @book = Book.find(params[:book_register][:book_id])
    current_user.register(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    current_user.unregister(@book)
  end
end
