class HomeController < ApplicationController
  def top
    @user = current_user
    @microposts = @user.microposts.all
  end

  def home
  end
end
