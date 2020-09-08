class SearchController < ApplicationController
  def users
    @user = current_user
    @users = params[:search].present? ? User.keyword_search(@user, params[:search]) : User.recommended_user(@user, @user.target, @user.my_choice_university)
    @keyword = params[:search] if params[:search].present?
    flash[:error] = ""
    flash[:error] = "キーワードを入力して下さい。" if params[:search] == ""
  end
end