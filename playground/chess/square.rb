module Chess
  class Square
    attr_accessor :row, :column, :occupant
    def initialize(column, row, occupant=nil)
      @column   = column
      @row      = row.to_i
      @occupant = occupant
    end
  end
end
