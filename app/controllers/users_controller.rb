class UsersController < ApplicationController
  def new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
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
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: users_path }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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