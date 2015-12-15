sum     = 0
old     = 0
current = 1

while current < 4_000_000
  sum += current if current.even?
  old, current = current, old + current
end

puts sum
