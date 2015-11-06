class HomeController < ApplicationController

  def index
    @students = ["LeShoya", "Tammy", "Daniel", "Karen", "Evelyn", "Chris"]
    @greeting_class = "gnome"
    user
  end

  def about_me
    user
  end

  def create

  end
end
