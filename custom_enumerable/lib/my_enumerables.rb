module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    if block_given?
      self
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield [self[i], i]
      i += 1
    end
    if block_given?
      self
    end
  end

  def my_select(&block)
    result = []
    self.my_each do |i|
      result << el if block.call(el) == true
    end
    result
  end

end
