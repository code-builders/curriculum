n   = 0
sum = 0
while n < 1000
  n += 1
  if n % 5 == 0 || n % 3 == 0
    sum += n
  end
end
puts sum
