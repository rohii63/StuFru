class WeekTargetsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @book = Book.find(params[:week_target][:book_id])
    @week_target = @user.week_targets.build()
    @week_target.book_id = @book.id
  end

  def create
    if params[:time]
      if !params[:time][:hours].present? && !params[:time][:minutes].present?
        params[:week_target][:content] = ""
      else
        hours_to_minute = params[:time][:hours].to_i * 60
        minutes = params[:time][:minutes].to_i
        params[:week_target][:content] = hours_to_minute + minutes
      end
    elsif params[:page]
      start_page = params[:page][:start].to_i   
      end_page = params[:page][:end].to_i      
      if start_page == 0 && end_page == 0
        params[:week_target][:content] = 10000
      elsif start_page == 0
        params[:week_target][:content] = 10001
      elsif end_page == 0
        params[:week_target][:content] = 10002
      elsif !(start_page == 0 && end_page == 0) && start_page >= end_page
        params[:week_target][:content] = 10003
      else
        params[:week_target][:content] = end_page - start_page
      end
    end
    @user = User.find(params[:user_id])
    @week_target = @user.week_targets.build(week_target_params)
    @week_target.save
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
end
