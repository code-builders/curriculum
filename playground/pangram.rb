class Pangram

  def initialize(word)
    @word = word.downcase
  end

  def is_pangram?
    letters = {}
    @word.chars.each do |l|
      letters[l] = true if l.between?("a", "z")
    end
    letters.size == 26
    # ("a".."z").each do |l|
    #   return false if !@word.include?(l)
    # end
    # true
  end
end
