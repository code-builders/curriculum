class FakeArray
  attr_accessor :values

  def initialize(*values)
    @values = *values
  end

  def each
    # return self if !block_given?
    index = 0
    while index < @values.length
      yield
      index += 1
    end
    self
  end

  def map
    new_array = []
    each {|n| new_array << yield(n) }
    new_array
  end

  def inspect
    "F" + @values.to_s
  end

end
