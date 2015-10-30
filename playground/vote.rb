class Vote
  attr_accessor :question
  attr_reader :results

  def initialize(q)
    @question = q
    @results  = {}
  end

  def cast(answer)
    @results[answer] ||= 0
    @results[answer] += 1
  end

  def total
    sum = 0
    @results.values.each {|n| sum += n }
    sum
  end
end
