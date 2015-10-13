class Chair
  attr_accessor :name
  # attr_reader :name, :weight
  # attr_writer :name, :weight

  def initialize(n,w)
    # define the name of the chair
    @name = n
    @weight = w
  end

  def yell_name
    @name.upcase + "!!!!!!"
  end

  # def name=(new_name)
  #   @name = new_name
  # end

  # def weight
  #   @weight
  # end

  # def weight=(new_weight)
  #   @weight = new_weight
  # end

end
