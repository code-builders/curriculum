class Recursion
  def countdown(x)
    return if x == 0
    puts x
    countdown(x-1)
  end

  def factorial(n)
    return 1 if n == 0
    n * factorial(n-1)
  end

  def factorial(n)
    sum = 1
    (1..n).to_a.each do |x|
      sum = x * sum
    end
    sum
    sum = 1
    (1..n).to_a.each do |x|
      sum = x * sum
    end
    sum
    sum = 1
    (1..n).to_a.each do |x|
      sum = x * sum
    end
    sum
    sum = 1
    (1..n).to_a.each do |x|
      sum = x * sum
    end
    sum
  end

end
