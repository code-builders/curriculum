class SessionsController < ApplicationController

  def sign_out
    # session[:u_id] = nil
    session.delete(:u_id)
    # flash[:notice] = "You were signed out."
    redirect_to "/", notice: "You were signed out."
  end

  def sign_in
    # find the user by username
    # authenticate that users password matches
      # if it's correct sign them in
      # else they need to try again
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:u_id] = @user.id
      redirect_to root_path, flash: {success: "You were signed in.", warning: "Your account was hacked"}
    else
      redirect_to root_path, flash: {warning: "Wrong username/password. Try again."}
    end

  end

end
