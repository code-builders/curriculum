class HomeController < ApplicationController

  def index
    @students = ["LeShoya", "Tammy", "Daniel", "Karen", "Evelyn", "Chris"]
    @greeting_class = "yell"
    user
    render json: @students
  end

  def about_me
    user
  end

  def create

  end
end
