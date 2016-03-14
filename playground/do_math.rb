class DoMath

  def self.do_math(x,y)
    yield(x,y)
  end

  def self.do_random_math(x)
    yield(x, rand(1000000))
  end

  def self.do_double_random_math
    yield(rand(1000000), rand(1000000))
  end

end
