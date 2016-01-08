class SecretMaker

  def initialize(word)
    @word = word
  end

  def secret
    result = @word.chars.map do|c|
      @word.length.times { c = c.next}
      c
    end
    result = result.reverse!.join
    result.gsub(/[aeiou]/, "z")

    result = result.chars.map do |c|
      [c.next.next.next + c.next.next + c + c.next.next.next.next.next.next.next.next].join
    end
    result = result.map(&:ord).join.to_i * 42
    i = 0
    result = result.to_s.chars.map do |n|
      i += 1
      [i,n]
    end
    result.reverse.join
  end
end
