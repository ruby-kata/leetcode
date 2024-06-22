# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    left_max_profits = Array.new(prices.size, 0)
    right_max_profits = Array.new(prices.size+1, 0)

    min = Float::INFINITY
    (0...prices.size).each do |i|
        if prices[i] < min
            min = prices[i]
            left_max_profits[i] = left_max_profits[i-1]
        else
            benefit = prices[i] - min
            left_max_profits[i] = [left_max_profits[i-1], benefit].max
        end
    end

    max = -Float::INFINITY
    (prices.size-1).downto(0).each do |i|
        if prices[i] > max
            max = prices[i]
            right_max_profits[i] = right_max_profits[i+1]
        else
            benefit = max - prices[i]
            right_max_profits[i] = [right_max_profits[i+1], benefit].max
        end
    end

    max_benefit = 0
    (0...prices.size).each do |i|
        max_benefit = [
            max_benefit,
            left_max_profits[i] + right_max_profits[i+1]
        ].max
    end

    max_benefit
end
