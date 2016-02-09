def reverse(word)
  half = word.length / 2
  puts half.inspect
  (0...half).each do |i|
    word[i], word[-i-1] = word[-i-1], word[i]
  end
  word
end
