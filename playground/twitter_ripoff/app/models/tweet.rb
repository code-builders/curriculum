class Tweet < ActiveRecord::Base
  validates :body, presence: true
  validates :body, length: {maximum: 140}

  def blah
    "blah"
  end
end
