class SessionsController < ApplicationController

  def sign_out
    # session[:u_id] = nil
    session.delete(:u_id)
    redirect_to "/"
  end

  def sign_in
    # find the user by username
    # authenticate that users password matches
      # if it's correct sign them in
      # else they need to try again
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:u_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

end
