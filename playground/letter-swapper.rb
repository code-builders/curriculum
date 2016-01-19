def swap(word)
  arr = word.chars
  new_word = []
  while !arr.empty?
    new_arr = arr.shift(2)
    new_arr.reverse! if new_arr.last =~ /[a-zA-Z]/
    new_word += new_arr
  end
  new_word.join
end

puts swap("Hello there!")
