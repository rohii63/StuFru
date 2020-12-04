class WeekTargetsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @week_targets = @user.week_targets.all
    @microposts = @user.microposts.all
    if @week_targets.present?
      number_of_days_elapsed = (Time.current.at_beginning_of_week - @week_targets.last.created_at.at_beginning_of_week).to_i
      @number_of_weeks_elapsed = number_of_days_elapsed / 604800
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.find(params[:user_id])
    @selected_book = Book.find(params[:week_target][:book_id])
    @status_with_book = @user.status_with_books.find_by(book_id: @selected_book.id)
    @week_target = @user.week_targets.build(book_id: @selected_book.id, study_unit: @status_with_book.study_unit)
    @week_targets = @user.week_targets.all.at_this_week
  end

  def create
    caliculate_week_target_content
    @user = User.find(params[:user_id])
    @week_target = @user.week_targets.build(week_target_params)
    return unless @week_target.save

    @week_targets = @user.week_targets.all.at_this_week
    @microposts = @user.microposts.all
    @book_categories = @user.book_categories.all
    @status_with_books = @user.status_with_books.all
  end

  def edit
    @user = User.find(params[:user_id])
    @week_target = WeekTarget.find(params[:id])
  end

  def update
    caliculate_week_target_content
    @user = User.find(params[:user_id])
    @week_target = WeekTarget.find(params[:id])
    @week_target.update(week_target_params)
    @microposts = @user.microposts.all
  end

  def destroy
    @user = User.find(params[:user_id])
    @week_target = WeekTarget.find(params[:id])
    @week_target.destroy
    @week_targets = @user.week_targets.all
  end

  private

  def week_target_params
    params.require(:week_target).permit(
      :content,
      :user_id,
      :book_id,
      :study_unit
    )
  end

  def caliculate_week_target_content
    if params[:time]
      hours = params[:time][:hours]
      minutes = params[:time][:minutes]
      if hours.blank? && minutes.blank?
        tmp = ''
      else
        hours_to_minute = hours.to_i * 60
        minutes = minutes.to_i
        tmp = hours_to_minute + minutes
      end
      params[:week_target][:content] = tmp
    elsif params[:page]
      start_page = params[:page][:start].to_i
      end_page = params[:page][:end].to_i
      tmp = if start_page.zero? && end_page.zero?
              10000
            elsif start_page.zero?
              10001
            elsif end_page.zero?
              10002
            elsif !(start_page.zero? && end_page.zero?) && start_page >= end_page
              10003
            else
              end_page - start_page
            end
      params[:week_target][:content] = tmp
    end
  end
end
