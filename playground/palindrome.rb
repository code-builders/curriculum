class Palindrome
  def initialize(word)
    @word = word.gsub(/\W/, "").downcase
  end

  def palindrome?
    @word.chars.each_with_index do |char, i|
      break if i > @word.length / 2
      return false if char != @word.chars[-i-1]
    end
    true
  end
end
