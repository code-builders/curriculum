require_relative "big_o"

arr1 = (1..10_000).to_a
arr2 = (1..1_000_000).to_a

start = Time.now
1000.times { BigO.new(arr1).binary_search(25000) }
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr1.size} took #{time_taken} ms"

start = Time.now
1000.times { BigO.new(arr2).binary_search(25000) }
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr2.size} took #{time_taken} ms"
