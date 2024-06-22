# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
    r = obstacle_grid.size
    c = obstacle_grid[0].size
    return 0 if obstacle_grid[0][0] == 1 || obstacle_grid[r-1][c-1] == 1
    
    dp = Array.new(2) { Array.new(c+1) { 0 } }
    dp[1-(flag = 0)][c-1] = 1

    (r-1).downto(0) { |i|
        (c-1).downto(0) { |j|
            if obstacle_grid[i][j] == 1
                dp[flag][j] = 0
            else
                dp[flag][j] = dp[1-flag][j] + dp[flag][j+1]
            end
        }
        flag = 1 - flag
    }

    dp[1-flag][0]
end
