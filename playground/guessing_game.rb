class GuessingGame

  def initialize
    @random = rand(1..100)
    @first = true
  end

  def guess(n)
    case n <=> @random
    when 1 then "Nope, the number is lower than #{n}"
    when -1 then "Nope, the number is higher than #{n}"
    else
      "Yep"
    end
  end

  def inspect
    if @first
      @first  = false
      "<#{self.class} random=?>"
    else
      "????"
    end
  end
end
