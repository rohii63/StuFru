class HomeController < ApplicationController
  def top
    if user_signed_in?
      @user = current_user
      @microposts = @user.feed
    end
  end

  def home
    @user = current_user
    @microposts = @user.microposts.all
    @total_study_times = @microposts.total_study_times
    @today_study_times = @microposts.today_study_times
    @this_week_study_times = @microposts.this_week_study_times
    @this_month_study_times = @microposts.this_month_study_times
  end

end
