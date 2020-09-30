class BookRegistersController < ApplicationController
  def create
    @book = Book.find(params[:book_register][:book_id])
    current_user.register(@book)
    render 'book_registers/btn'
  end

  def destroy
    @book = Book.find(params[:id])
    current_user.unregister(@book)
    render 'book_registers/btn'
  end
end
