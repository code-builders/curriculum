class StudyController < ApplicationController

  def index
    @cards = FlashCard.all
  end

  def new

  end

end
