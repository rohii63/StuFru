class WeekTargetsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @week_targets = @user.week_targets.all
    @microposts = @user.microposts.all
    @number_of_weeks_passed = (Time.current.at_beginning_of_week - @week_targets.last.created_at.at_beginning_of_week).to_i / 604800
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.find(params[:user_id])
    @selected_book = Book.find(params[:week_target][:book_id])
    @week_target = @user.week_targets.build()
    @week_targets = @user.week_targets.all.at_this_week()
    @week_target.book_id = @selected_book.id
  end

  def create
    substitute_params_for_week_target_content
    @user = User.find(params[:user_id])
    @week_target = @user.week_targets.build(week_target_params)
    if @week_target.save
      @week_targets = @user.week_targets.all.at_this_week()
      @microposts = @user.microposts.all
      @book_categories = @user.book_categories.all
      @books = @user.books.all
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @week_target = WeekTarget.find(params[:id])
  end

  def update
    substitute_params_for_week_target_content
    @user = User.find(params[:user_id])
    @week_target = WeekTarget.find(params[:id])
    @week_target.update(week_target_params)
    @microposts = @user.microposts.all
  end

  def destory
  end

  private

    def week_target_params
      params.require(:week_target).permit(
        :content,
        :book_id,
        :user_id
      )
    end

    def substitute_params_for_week_target_content
      if params[:time]
        hours = params[:time][:hours]
        minutes = params[:time][:minutes]
        if !hours.present? && !minutes.present?
          tmp = ""
        else
          hours_to_minute = hours.to_i * 60
          minutes = minutes.to_i
          tmp = hours_to_minute + minutes
        end
        params[:week_target][:content] = tmp
      elsif params[:page]
        start_page = params[:page][:start].to_i   
        end_page = params[:page][:end].to_i      
        if start_page == 0 && end_page == 0
          tmp = 10000
        elsif start_page == 0
          tmp = 10001
        elsif end_page == 0
          tmp = 10002
        elsif !(start_page == 0 && end_page == 0) && start_page >= end_page
          tmp = 10003
        else
          tmp = end_page - start_page
        end
        params[:week_target][:content] = tmp
      end
    end
end
