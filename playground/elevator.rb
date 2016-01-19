class Elevator

  def initialize
    @shafts = {a: 1}
  end

  def current_floor
    @shafts[:a]
  end

  def move(f)
    @shafts[:a] = f
  end

  def go(from, to, direction)
    move(from)
    move(to)
  end

  def go_up(from, to)
    go(from, to) if to > from
  end

  def go_down(from, to)
    go(from, to) if to < from
  end

end
