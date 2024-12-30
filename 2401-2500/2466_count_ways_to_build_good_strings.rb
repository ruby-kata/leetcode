# @param {Integer} low
# @param {Integer} high
# @param {Integer} zero
# @param {Integer} one
# @return {Integer}
def count_good_strings(low, high, zero, one)
    mod = 1000000007
    dp = Array.new(high + 1, 0)
    dp[0] = 1
    (1..high).each { |i|
        dp[i] = (dp[i] + dp[i - zero]) % mod if i - zero >= 0
        dp[i] = (dp[i] + dp[i - one]) % mod if i - one >= 0
    }

    dp[low..high].sum % mod
end
