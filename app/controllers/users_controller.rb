class UsersController < ApplicationController

  def my_page
    @user = User.find(params[:id])
    @microposts = @user.microposts.all
    if params[:term]
      @term = params[:term]
      @from = params[:from].to_i
      @to = params[:to].to_i
      case params[:button]
        when "before"
          @from += 1
          @to += 1
        when "after"
          @from -= 1
          @to -= 1
      end
      render 'switch_graph'
    elsif params[:chart]
      @week_targets = @user.week_targets.all.at_this_week()
      @from = 6
      @to = 0
      render 'chart'
    else
      @week_targets = @user.week_targets.all.at_this_week()
      @books = @user.books.all
      @books_in_progress = @user.books.where(status: "勉強中")
      @book_categories = @user.book_categories.all
      @week_target = @user.week_targets.build()
      @total_study_time = @microposts.total_study_time
      @today_study_time = @microposts.today_study_time
      @this_week_study_time = @microposts.this_week_study_time
      @this_month_study_time = @microposts.this_month_study_time
      @from = 6
      @to = 0
      
    end
  end

  def index
    @users = User.all
  end

  def show
    if params[:modal_name]
      @modal_name = params[:modal_name]
      render 'users/modal'
    else
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
  end

  def update
    if params[:target]
      if params[:target][:content].present?
        redirect_to university_search_path()
      end
    end
    @user = current_user
    @user.update(user_params)
    @modal_name = params[:modal_name]
    @area_name = params[:area_name]
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