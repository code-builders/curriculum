class Music
  attr_accessor :title, :artist, :price

  def initialize(attrs)
    @title  = attrs[:title]
    @artist = attrs[:artist]
    @price  = attrs[:price]
  end

  def needs_to_be_shipped?
    true
  end

  def downloadable?
    false
  end
end

require_relative "./cd"
require_relative "./mp3"

require_relative "./sample"
