# @param {Integer[][]} grid
# @return {Integer}
def max_moves(grid)
    rows = grid.length
    cols = grid[0].length
    dp = Array.new(2) { Array.new(rows, 0) }
    flag = 0
    (cols - 2).downto(0) { |c|
        flag = 1 - flag
        (0...rows).each { |r|
            dp[flag][r] = [
                (r > 0 && grid[r][c] < grid[r-1][c+1]) ? 1 + dp[1-flag][r-1] : 0,
                grid[r][c] < grid[r][c+1] ? 1 + dp[1-flag][r] : 0,
                (r < rows-1 && grid[r][c] < grid[r+1][c+1]) ? 1 + dp[1-flag][r+1] : 0
            ].max
        }
    }
    dp[flag].max
end
