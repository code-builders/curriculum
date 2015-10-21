class Chair
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def yell
    name.upcase + "!!"
  end
end
