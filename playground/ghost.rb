class Ghost
  CEMETARY = "Lake View"

  def self.cemetary
    # self == Ghost
    CEMETARY
  end

  def self.file
    __FILE__
  end

  def cemetary
    Ghost::CEMETARY
  end

  def initialize(name)
    @name = name
    @opacity = 0.5
  end

  def name
    @name
  end

  def spookily_say_name
    "Ooohhh I am #{@name}"
  end

  def what_am_i
    puts spookily_say_name
  end

  def self.rise_from_the_grave(name)
    # self in this scope is the Ghost class
    new(name)
  end

  def self.can_float?
    true
  end

end



# --------------------- Instance stuff below

# g = Ghost.new("Casper")
# @name = "Gerald" # This does NOT change the @name used in class Ghost
# g.name # => "Casper"
#
