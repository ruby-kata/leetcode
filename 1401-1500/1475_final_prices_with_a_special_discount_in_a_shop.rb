# @param {Integer[]} prices
# @return {Integer[]}
def final_prices(prices)
    ans = []
    stack = []
    prices.reverse.each do |price|
        ans.unshift(price)
        stack.pop while !stack.empty? && stack.last > price
        ans[0] -= stack.last unless stack.empty?
        stack.push(price)
    end

    ans
end
