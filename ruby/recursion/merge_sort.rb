def merge_sort(array)
  # If the array is empty or contains only one element, it is already sorted
  return array if array.length <= 1
  
  # Divide the array into two halves
  mid = array.length / 2
  left_half = array[0...mid]
  right_half = array[mid..-1]
  
  # Recursively sort the left and right halves
  sorted_left_half = merge_sort(left_half)
  sorted_right_half = merge_sort(right_half)
  
  # Merge the two sorted halves
  merge(sorted_left_half, sorted_right_half)
end

def merge(left_half, right_half)
  sorted_array = []
  
  # While there are still elements in both halves
  while !left_half.empty? && !right_half.empty?
    if left_half.first <= right_half.first
      sorted_array << left_half.shift
    else
      sorted_array << right_half.shift
    end
  end
  
  # Add any remaining elements from the left or right half
  sorted_array += left_half
  sorted_array += right_half
  
  sorted_array
end

array = [5, 2, 8, 4, 1, 9, 6, 3, 7]
sorted_array = merge_sort(array)
puts sorted_array.inspect #=> [1, 2, 3, 4, 5, 6, 7, 8, 9]
