class UpDown
  def go_to(instructions, floor=1)
    return floor if instructions == ""
    l = instructions.slice!(-1)
    floor += l == "u" ? 1 : -1
    go_to(instructions, floor)
  end
end
