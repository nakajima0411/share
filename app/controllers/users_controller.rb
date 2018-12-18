class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  	@user = User.find(params[:id])
      if @user == current_user
      else
       redirect_to user_path(current_user)
      end
  end

  private
  def user_params
      params.require(:user).permit(:name, :profile_image, :email, :password)
  end
end
