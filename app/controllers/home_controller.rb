class HomeController < ApplicationController
  def top
    if user_signed_in?
      if params[:modal]
        render 'modal_open'

      elsif params[:micropost]
        @user = current_user
        book_id = params[:micropost][:book_id]
        @selected_book = @user.status_with_books.find_by(book_id: book_id) if book_id.present?
        render 'modal'

      elsif params[:layout]
        render 'change_layout'

      elsif params[:paginate]
        @user = current_user
        case params[:paginate]
        when 'follow'
          @microposts_follower = @user.feed.page(params[:page]).per(10)
          render 'paginate_follow'
        when 'target_genre'
          @microposts_target_genre = User.feeds_of_users_with_same_target(@user.id, @user.target, @user.my_choice_university).page(params[:page]).per(10)
          render 'paginate_target_genre'
        end

      else
        @user = current_user
        @micropost = @user.microposts.build
        @books_in_progress = @user.books_in_progress
        @microposts_follower = @user.feed.page(params[:page]).per(10)
        @microposts_target_genre = User.feeds_of_users_with_same_target(@user.id, @user.target, @user.my_choice_university).page(params[:page]).per(10)
        unless @user.target
          targets = []

          8.times do |n|
            n += 1
            targets.push(Target.new(target_category_id: n.to_s))
          end

          @navbars = {}
          targets.each do |t|
            @navbars.store(t.target_category_id, t.targetCategory.name)
          end
        end
      end
    else
      redirect_to new_user_session_path
    end
  end
end
