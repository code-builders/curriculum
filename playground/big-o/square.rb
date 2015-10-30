require_relative "big_o"

arr1 = (1..1000).to_a.shuffle
arr2 = (1..12000).to_a.shuffle

start = Time.now
BigO.new(arr1).bubble_sort.inspect
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr1.size} took #{time_taken} ms"

start = Time.now
BigO.new(arr2).bubble_sort
time_taken = ((Time.now. - start) * 1000.0).to_i
puts "Array of #{arr2.size} took #{time_taken} ms"
