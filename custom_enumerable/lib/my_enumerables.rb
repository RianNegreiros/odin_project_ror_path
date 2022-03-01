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
      result << i if block.call(i) == true
    end
    result
  end

  def my_all?(&block)
    result = true
    self.my_each do |i|
      if yield(i) == false
        result = false
      end
    end
    result
  end

  def my_any?(&block)
    self.my_each do |i|
      return true if yield i
    end
    false
  end

  def my_none?(&block)
    self.my_each do |i|
      return false if yield i
    end
    true
  end

  def my_count(&block)
    result = 0
    if !block_given?
      result = self.length
    elsif block_given?
      self.my_each do |i|
        if yield i
          result += 1
        end
      end
    end
    result
  end

end
