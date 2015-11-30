class UsersController < ApplicationController

  def create
    @user = User.new(params.require(:user).permit(:username))
    @user.save
    session[:u_id] = @user.id
    redirect_to root_path
  end
end
