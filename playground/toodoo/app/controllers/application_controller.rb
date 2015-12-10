class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user
  before_action :require_login, except: [:show, :index]

  def set_current_user
    if session[:u_id]
      @current_user = User.find(session[:u_id])
    end
  end

  def require_login
    if @current_user.blank?
      redirect_to root_path, notice: "You must be signed in to do that"
    end
  end

end
