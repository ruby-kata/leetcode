# @param {Integer[][]} grid
# @return {Integer}
def min_falling_path_sum(grid)
    r_size = grid.length
    c_size = grid[0].length
    return grid[0][0] if r_size == 1

    dp = Array.new(2) { Array.new(c_size + 2, 0) }
    dp[0][0] = dp[0][c_size+1] = dp[1][0] = dp[1][c_size+1] = Float::INFINITY
    cur = 0

    (r_size-1).downto(0) do |r|
        cur = 1 - cur
        (0...c_size).each do |c|
            dp[cur][c+1] = grid[r][c] + [dp[1-cur][0..c].min, dp[1-cur][c+2..].min].min
        end
    end

    dp[cur].min
end
