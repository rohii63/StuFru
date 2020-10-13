class HomeController < ApplicationController
  def top
    if user_signed_in?
      if params[:modal]
        render 'modal_open'

      elsif params[:micropost]
        book_id = params[:micropost][:book_id]
        @selected_book = Book.find(book_id) if book_id.present?
        render 'modal'
      
      else
        @user = current_user
        @micropost = @user.microposts.build()
        @books_in_progress = @user.books.where(status: "勉強中")
        @follower_microposts = @user.feed
        @target_genre_microposts = User.feeds_of_users_with_same_target(@user.id, @user.target, @user.my_choice_university)

        unless @user.target
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
    end
  end
end
