class SearchController < ApplicationController
  def users
    @user = current_user
    @users = params[:search].present? ? User.keyword_search(@user, params[:search]) : User.recommended_user(@user, @user.target, @user.my_choice_university)
    @keyword = params[:search] if params[:search].present?
    flash[:error] = ""
    flash[:error] = "キーワードを入力して下さい。" if params[:search] == ""
  end

  def universities
    @user = current_user
    if params[:university_name]
      @user.my_choice_university = params[:university_name]
      render 'open_modal'
    elsif params[:keyword]
      @universities = University.name_search(params[:keyword])
      render 'university_search'
    else
      @universities = University.all
    end
  end
end