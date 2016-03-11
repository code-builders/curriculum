module Chess
  class Pawn
    attr_accessor :side, :starting_position

    def initialize(side)
      @side = side
      @starting_position = true
    end

    def starting_position?
      starting_position
    end

    def light_side?
      side == :light
    end

    def dark_side?
      !light_side?
    end

    def backward?(from_row, to_row)
      if dark_side? && to_row >= from_row
        true
      elsif light_side? && to_row <= from_row
        true
      else
        false
      end
    end

    def can_move_to?(from, to)
      return false if backward?(from.row, to.row)
      # TBD put in more logic here
      true
    end

    def moved_to(square)
      starting_position = false
    end
  end
end
