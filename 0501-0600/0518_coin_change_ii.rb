# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
    return 1 if amount.zero?

    dp = Array.new(amount + 1) { 0 }
    dp[0] = 1

    coins.each do |coin|
        (0..amount-coin).each do |a|
            dp[a + coin] += dp[a]
        end
    end

    dp[amount]
end
