# @param {Integer[]} prices
# @param {Integer} money
# @return {Integer}
def buy_choco(prices, money)
    min = Float::INFINITY
    second_min = min
    prices.each do |price|
        if price < min
            second_min = min
            min = price
        elsif price < second_min
            second_min = price
        end
    end

    min + second_min > money ? money : money - (min + second_min)
end
