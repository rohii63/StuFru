class Api::UsersController < ApiController
  def index
    users = User.select(:id, :name)
    render json: users
  end

  def show
    @user = User.find(params[:id])
    user = User.select(:id, :name, :target_comment, :introduction, :target, :sex, :age, :live, :job, :my_choice_university).find(params[:id]).attributes
    user.store("followers_count", @user.followers.count)
    user.store("following_count", @user.following.count)
    user.store("books_count", @user.books.count)
    user.store("avatar", url_for(@user.avatar.variant(gravity: :center, resize:"60x60^", crop:"60x60+0+0")))
    render json: user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      head :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name, :target_comment, :introduction, :target, :sex, :age, :live, :job, :my_choice_university)
  end
end