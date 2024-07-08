# @param {Integer} n
# @return {Integer}
def check_record(n)
    mod = 1000000007
    dp = Array.new(2) { Array.new(2) {
        [
            0, # A at the beginning
            0, # one L at the end
            0  # two L at the end
        ]
    }}

    curr = 0
    dp[curr][0][0] = 1
    
    n.times {
        curr = 1 - curr

        # [no A] << P, [no A]L << P, [no A]LL << P -> reset number of L at the end
        dp[curr][0][0] = (dp[1-curr][0][0] + dp[1-curr][0][1] + dp[1-curr][0][2]) % mod
        # [no A] << L -> [no A]L
        dp[curr][0][1] = dp[1-curr][0][0]
        # [no A]L << L -> [no A]LL
        dp[curr][0][2] = dp[1-curr][0][1]
        # [no A] << A
        dp[curr][1][0] = dp[1-curr][0][0] + dp[1-curr][0][1] + dp[1-curr][0][2]

        # [one A] << P
        dp[curr][1][0] += dp[1-curr][1][0] + dp[1-curr][1][1] + dp[1-curr][1][2]
        dp[curr][1][0] %= mod
        # [one A] << L
        dp[curr][1][1] = dp[1-curr][1][0]
        # [one A]L << L
        dp[curr][1][2] = dp[1-curr][1][1]
    }

    ((dp[curr][0].sum % mod) + (dp[curr][1].sum % mod)) % mod
end
