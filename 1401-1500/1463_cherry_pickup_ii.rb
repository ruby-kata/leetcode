# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
    r = grid.size
    c = grid[0].size
    dp = Array.new(2) { Array.new(c) { Array.new(c, 0) } }
    flag = 0

    (r-1).downto(0) do |i|
        flag = 1 - flag
        (0...c).each do |j|
            (0...c).each do |k|
                max = 0
                (j-1..j+1).each do |_j|
                    (k-1..k+1).each do |_k|
                        next if _j < 0 || _j >= c || _k < 0 || _k >= c
                        max = dp[1-flag][_j][_k] if max < dp[1-flag][_j][_k]
                    end
                end
                max += (j == k ? grid[i][j] : grid[i][j] + grid[i][k])
                dp[flag][j][k] = max if dp[flag][j][k] < max 
            end
        end
    end

    dp[flag][0][c-1]
end
