n = 1
target = 600851475143
largest = 0
while n < Math.sqrt(target)
  n += 2
  puts n
  next if 3.upto(n-1).any? {|k| n % k == 0}
  largest = n if target % n == 0
end

puts largest
