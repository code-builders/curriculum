class Pawn
  def initialize(position)
    @position = position
  end

  def move(position)
    @position = position
  end

  def die
    @position = nil
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row
  def self.make_row(side)
    if side == "white"
      num = 2
    else
      num = 7
    end

    ("a".."h").collect do |letter|
      new("#{letter}#{num}")
    end
  end
end
