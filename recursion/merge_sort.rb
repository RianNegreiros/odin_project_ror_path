def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  arr1 = merge_sort(arr.slice(0, mid))
  arr2 = merge_sort(arr.slice(mid, arr.length - mid))

  arr = []
  i = 0
  j = 0
  while i < arr1.length && j < arr2.length
    el1 = arr1[i]
    el2 = arr2[j]

    if el1 <= el2
      arr << el1
      i += 1
    else
      arr << el2
      j += 1
    end
  end

  while i < arr1.length
    arr << arr1[i]
    i += 1
  end

  while j < arr2.length
    arr << arr2[j]
    j += 1
  end
  arr
end

puts merge_sort([2,9,3,8,4,8,8,2])