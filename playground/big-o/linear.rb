require_relative "big_o"

# O(1)
# Constant time means that the time it takes is constant
# regardless of the size of the data.

arr1 = (1..1_000).to_a
arr2 = (1..2_000).to_a
arr3 = (1..4_000).to_a

start = Time.now
100.times { BigO.new(arr1).how_many_in_array(100) }
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr1.size} took #{time_taken} ms"

start = Time.now
100.times { BigO.new(arr2).how_many_in_array(100) }
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr2.size} took #{time_taken} ms"

start = Time.now
100.times { BigO.new(arr3).how_many_in_array(100) }
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr3.size} took #{time_taken} ms"
