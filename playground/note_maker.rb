class NoteMaker
  attr_accessor :magazine, :goal

  def initialize(goal, magazine)
    @magazine = magazine
    @goal     = goal
  end

  def letter_bank
    @letter_bank ||= begin
      letter_bank = {}
      magazine.downcase.chars.each do |l|
        letter_bank[l] ||= 0
        letter_bank[l] += 1
      end
      letter_bank
    end
  end

  def note
    new_note = ""
    goal.chars.each do |l|
      if letter_bank[l.downcase].to_i > 0
        new_note << l
        letter_bank[l.downcase] -= 1
      else
        new_note << " "
      end
    end
    new_note
  end
end
