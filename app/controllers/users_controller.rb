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
    elsif params[:paginate]
      @timeline = @microposts.all.page(params[:page]).per(10)
      render 'shared/paginate_timeline'
    else
      @timeline = @microposts.all.page(params[:page]).per(10)
      @week_targets = @user.week_targets.all.at_this_week()
      @status_with_books = @user.status_with_books.all
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
    @users = User.take(25)
  end

  def show
    if params[:modal_name]
      @modal_name = params[:modal_name]
      render 'users/modal'
    else
      @user = current_user
      @books = @user.books.all
      create_target_list
    end
  end

  def update
    if params[:from_index]
      @user = User.find(params[:id])
      @user.update(user_params)
      render 'update_avatar'

    else
      @user = current_user
      @user.update(user_params)

      if params[:top_page]
        if @user.target == "大学受験合格"
          redirect_to university_search_path(from_top: "")
        else
          redirect_to root_path()
        end
  
      elsif params[:target] && @user.my_choice_university.nil?
        redirect_to university_search_path()
      
      else
        @modal_name = params[:modal_name]
        @area_name = params[:area_name]
        create_target_list
        respond_to do |format|
          if params[:from_top]
            format.html { redirect_to root_path() }
          else
            format.html { redirect_to user_path(@user) }
            format.js
          end
        end
      end  
    end
  end

  def follow
    @user = User.find(params[:id])
    @followers = @user.followers.all
    @following = @user.following.all
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :avatar,
        :target_comment,
        :introduction,
        :target,
        :sex,
        :age,
        :live,
        :job,
        :my_choice_university
        )
    end

    def create_target_list
      tmpTargets = []

      8.times do |n|
        n += 1
        tmpTargets.push(Target.new(target_category_id: "#{n}"))
      end

      @navbars = {}

      tmpTargets.each do |t| 
        @navbars.store(t.target_category_id, t.targetCategory.name) 
      end 

    end
  end