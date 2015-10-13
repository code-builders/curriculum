# ar = []
# ar.push("Hello")
# ar << "Goodbye"

foods = []
puts "What are the 3 foods that you would want on a dessert island?"

while foods.size < 3

  food = gets.chomp
  # food is a string from user input like "cheese cake"
  foods << food

end

puts "Wow! You want to eat #{foods.join(' and ')}, blech!"
