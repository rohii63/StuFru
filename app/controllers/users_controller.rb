class UsersController < ApplicationController
  def new
  end

  def show
  end

  def edit
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
        :university,
        :high_school
        )
    end
  end