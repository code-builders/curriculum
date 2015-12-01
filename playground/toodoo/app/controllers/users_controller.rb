class UsersController < ApplicationController

  def create
    # @user = User.new(params.require(:user).permit(:username, :password, :password_confirmation))
    @user = User.new
    @user.username              = params[:user][:username]
    @user.password              = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.save
    session[:u_id] = @user.id
    redirect_to root_path
  end
end
