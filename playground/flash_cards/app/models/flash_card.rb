class FlashCard < ActiveRecord::Base
  validates :question, :answer, presence: true
end
