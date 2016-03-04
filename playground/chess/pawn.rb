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
      from_row = from[-1].to_i
      to_row   = to[-1].to_i
      return false if backward?(from_row, to_row)
      # TBD put in more logic here
      true
    end

    def moved_to(square)
      starting_position = false
    end
  end
end
