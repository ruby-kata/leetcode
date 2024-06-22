# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  sell = 0
  buy = -Float::INFINITY

  prices.each do |price|
      sell = [sell, buy + price].max
      buy = [buy, -price].max
  end
  
  sell
end
