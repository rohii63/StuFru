class HomeController < ApplicationController
  def top
    if user_signed_in?
      @user = current_user
      @micropost = @user.microposts.build()
      @books = @user.books.all
      @book_names = @books.pluck(:name)
      @microposts = @user.feed
    end
  end

  def home
    @user = current_user
    @microposts = @user.microposts.all
    @total_study_time = @microposts.total_study_time
    @today_study_time = @microposts.today_study_time
    @this_week_study_time = @microposts.this_week_study_time
    @this_month_study_time = @microposts.this_month_study_time
  end

end
