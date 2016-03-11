require_relative "square"
require_relative "pawn"

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
      @squares = Array.new(8)
      @squares[0] = generate_row(1)
      @squares[2] = generate_row(3)
      @squares[3] = generate_row(4)
      @squares[4] = generate_row(5)
      @squares[5] = generate_row(6)
      @squares[7] = generate_row(8)

      @squares[1] = generate_row(2, Chess::Pawn.new(:light))
      @squares[6] = generate_row(7, Chess::Pawn.new(:dark))
    end

    def generate_row(n, occupant=nil)
      ("a".."h").map do |l|
        Chess::Square.new(l, n, occupant)
      end
    end

    def square(x,y)
      x = x.downcase.to_sym
      missing_square! if !has_square?(x,y)
      squares[row(y)][col(x)]
    end

    def col(x)
      Board::LETTERS[x]
    end

    def row(y)
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
