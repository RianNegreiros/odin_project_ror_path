def stock_picker(arr)
  last = 0
  buy = 0
  sell = 0

  arr.each_with_index do |day, index|
    (index + 1..arr.length - 1).each do |j|
      profit = arr[j] - day
      next unless profit > last

      last = profit
      buy = index
      sell = j
    end
  end
  [buy, sell]
end

p stock_picker([0, 3, 6, 9, 5, 8, 6, 1, 10])
