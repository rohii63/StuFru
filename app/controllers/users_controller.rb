class UsersController < ApplicationController

  def my_page
    unless params[:term]
      @user = User.find(params[:id])
      @books = @user.books.all
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
      @user = User.find(params[:id])
      @microposts = @user.microposts.all
      if params[:left]
        @from += 1
        @to += 1
      end
      if params[:right]
        @from -= 1
        @to -= 1
      end
      respond_to do |format|
        format.js { render 'home/home' }
      end
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @books = @user.books.all
    @tmpTargets = []
    8.times do |n|
      n += 1
      @tmpTargets.push(Target.new(target_category_id: "#{n}"))
    end
    @targetContent1 = Target.where(target_category_id:1)
    @targetContent2 = Target.where(target_category_id:2)
    @targetContent3 = Target.where(target_category_id:3)
    @targetContent4 = Target.where(target_category_id:4)
    @targetContent5 = Target.where(target_category_id:5)
    @targetContent6 = Target.where(target_category_id:6)
    @targetContent7 = Target.where(target_category_id:7)
    @targetContent8 = Target.where(target_category_id:8)
  end

  def update
    @user = current_user
    @user.update(user_params)
    @modal_name = params[:modal][:name]
  end

  def follow
    @user = current_user
    @followers = @user.followers.all
    @following = @user.following.all
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :avatar,
        :target_comment,
        :introduction,
        :target,
        :gender,
        :age,
        :live,
        :job,
        :my_choice_university
        )
    end
  end