query_string = "first_name=Ada&last_name=Lovelace&dob=1815&title=Countess"

arr = query_string.split("&")

arr = arr.collect {|qs| qs.split("=") }

result = {}

arr.each do |inner_array|
  # take the element at index 0 as a symbol
  # assign it as a key in the result hash
  # assign the element at index 1 to that key
  key = inner_array[0].to_sym
  result[key] = inner_array[1]
end

puts result[:first_name]
puts result[:last_name]
