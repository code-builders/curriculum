class Bird
  def talk
    puts "Squak, I'm a bird"
  end

  def fly
    puts "*soars*"
  end
end

class Penguin < Bird

  def fly
    nil
  end

end


class User < ActiveRecord::Base

end

class User

end
class Chicken < Bird
  attr_accessor :health
  def talk
    puts "cluck"
  end

  def fly
    if @health > 7
      super
    else
      puts "thud"
    end
  end
end

class Chick < Chicken

end
