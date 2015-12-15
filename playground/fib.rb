def countdown(n)
  return if n <= 0
  countdown(n-1)
end

def factorial(n)
  return 1 if n == 0
  n * factorial(n-1)
end
