class StudyController < ApplicationController

  def index
    @cards = FlashCard.all
    # render :index
  end

  def new
    @user = User.find(1)
    @card = FlashCard.new
    # render :new
  end

  def create
    @card = FlashCard.new
    @card.question = params[:q]
    @card.answer   = params[:a]
    if @card.save
      redirect_to "/"
    else
      @user = User.find(1)
      render :new
    end
    # render :create
  end

end
