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
  end

end
