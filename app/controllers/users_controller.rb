class UsersController < ApplicationController

  def my_page
    @user = User.find(params[:id])
    @books = @user.books.all
  end

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @books = @user.books.all
    @temporaryTargets = []
    8.times do |n|
      n += 1
      @temporaryTargets.push(Target.new(target_category_id: "#{n}"))
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
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "編集完了"
        redirect_to user_path(@user)
      else
        @books = @user.books.all
        @temporaryTargets = []
        8.times do |n|
          n += 1
          @temporaryTargets.push(Target.new(target_category_id: "#{n}"))
        end
        @targetContent1 = Target.where(target_category_id:1)
        @targetContent2 = Target.where(target_category_id:2)
        @targetContent3 = Target.where(target_category_id:3)
        @targetContent4 = Target.where(target_category_id:4)
        @targetContent5 = Target.where(target_category_id:5)
        @targetContent6 = Target.where(target_category_id:6)
        @targetContent7 = Target.where(target_category_id:7)
        @targetContent8 = Target.where(target_category_id:8)
        render 'show'
      end
  end

  def follow
    @user = User.find(params[:id])
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