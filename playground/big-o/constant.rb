require_relative "big_o"

# O(1)
# Constant time means that the time it takes is constant
# regardless of the size of the data.

arr1 = (1..10).to_a
arr2 = (1..100_000).to_a

start = Time.now
1000.times { BigO.new(arr1).is_first_element_nil? }
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr1.size} took #{time_taken} ms"

start = Time.now
1000.times { BigO.new(arr2).is_first_element_nil? }
time_taken = (Time.now. - start).to_i * 1000
puts "Array of #{arr2.size} took #{time_taken} ms"
