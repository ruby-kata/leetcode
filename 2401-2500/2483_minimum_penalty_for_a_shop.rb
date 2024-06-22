# @param {String} customers
# @return {Integer}
def best_closing_time(customers)
    max_profit = 0
    profit = 0
    earliest = 0

    (0...customers.size).each do |i|
        profit += customers[i] == "Y" ? 1 : -1
        if profit > max_profit
            max_profit = profit
            earliest = i + 1
        end
    end

    earliest
end
