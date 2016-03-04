module Chess
  class Board
    LETTERS = {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6,
      h: 7
    }

    attr_accessor :squares
    def initialize
      @squares = Array.new(8, Array.new(8))
    end

    def square(x,y)
      x = x.downcase.to_sym
      missing_square! if !has_square?(x,y)
      squares[row(x)][col(y)]
    end

    def row(x)
      Board::LETTERS[x]
    end

    def col(y)
      y - 1
    end

    def has_square?(x,y)
      x.between?(:a,:h) && y.between?(1,8)
    end

    def missing_square!
      raise "That square isn't on a chess board"
    end
  end
end
