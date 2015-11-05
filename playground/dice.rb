class Dice
  attr_accessor :values

  def initialize
    @values = []
  end

  def roll(num_of_dice=1)
    @values = []
    num_of_dice.times do
      @values << (1..6).to_a.sample
    end
    @values
  end

end
