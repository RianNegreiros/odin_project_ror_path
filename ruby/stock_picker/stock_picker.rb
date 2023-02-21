def stock_picker(prices)
  max_profit = 0
  buy_day = 0
  sell_day = 0
  
  prices.each_with_index do |buy_price, day|
    (day+1..prices.length-1).each do |sell_day_index|
      sell_price = prices[sell_day_index]
      if sell_price - buy_price > max_profit
        max_profit = sell_price - buy_price
        buy_day = day
        sell_day = sell_day_index
      end
    end
  end
  
  [buy_day, sell_day]
end

prices = [17,3,6,9,15,8,6,1,10]
best_days = stock_picker(prices)
puts "Best day to buy: #{best_days[0]}"
puts "Best day to sell: #{best_days[1]}"