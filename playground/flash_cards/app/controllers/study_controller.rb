class StudyController < ApplicationController

  def index
    @cards = FlashCard.all
  end

end
