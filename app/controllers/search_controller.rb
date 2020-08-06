class SearchController < ApplicationController
  def users
    @user = current_user
    @users = params[:search].present? ? User.name_search(params[:search]) : User.recommended_user(@user, @user.target, @user.my_choice_university)
    @keyword = params[:search].present? ? params[:search] : "－おすすめユーザ－"
  end
end