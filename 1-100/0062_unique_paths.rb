# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    dp = Array.new(2) { Array.new(n+1, 0) }
    dp[curr = 0][n-1] = 1
    (m).downto(1) do |i|
        curr = 1 - curr
        (n-1).downto(0) do |j|
            dp[curr][j] = dp[curr][j+1] + dp[1-curr][j] 
        end
    end

    dp[curr][0]
end
