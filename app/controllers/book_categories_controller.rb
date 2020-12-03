class BookCategoriesController < ApplicationController
  def new
    @user = current_user
    @book_category = @user.book_categories.build()
    @modal = params[:modal]
  end

  def create
    @user = current_user
    @book_category = @user.book_categories.build(book_category_params)
    @book_category.save
    @book_categories = @user.book_categories.all
    @modal = params[:modal]
  end

  def destroy
  end

  private

  def book_category_params
    params.require(:book_category).permit(:name, :user_id)
  end
end
