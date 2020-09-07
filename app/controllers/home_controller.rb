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
    unless params[:term]
      @user = current_user
      @microposts = @user.microposts.all
      @total_study_time = @microposts.total_study_time
      @today_study_time = @microposts.today_study_time
      @this_week_study_time = @microposts.this_week_study_time
      @this_month_study_time = @microposts.this_month_study_time
      @from = 6
      @to = 0
    else
      @term = params[:term]
      @from = params[:from].to_i
      @to = params[:to].to_i
      @microposts = current_user.microposts.all
      if params[:left]
        @from += 1
        @to += 1
      end
      if params[:right]
        @from -= 1
        @to -= 1
      end
    end
  end

end
