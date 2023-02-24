def fibonacci(n)
  if n <= 1
    return n
  else
    return fibonacci(n-1) + fibonacci(n-2)
  end
end

# Example usage
puts fibonacci(0) # 0
puts fibonacci(1) # 1
puts fibonacci(10) # 55
