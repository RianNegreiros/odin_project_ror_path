def bubble_sort(array)
  # Loop through each element in the array, comparing it with the next element and swapping if necessary
  for i in 0..array.length-2
    for j in 0..array.length-i-2
      if array[j] > array[j+1]
        temp = array[j]
        array[j] = array[j+1]
        array[j+1] = temp
      end
    end
  end
  
  array
end

array = [5, 1, 4, 2, 8]
sorted_array = bubble_sort(array)
puts sorted_array
