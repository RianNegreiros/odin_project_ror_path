class Calculator
  def add(*numbers)
    numbers.sum
  end

  def multiply(*numbers)
    numbers.reduce(:*)
  end

  def subtract(a, b)
    a - b
  end
end