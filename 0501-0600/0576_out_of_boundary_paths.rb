# @param {Integer} m
# @param {Integer} n
# @param {Integer} max_move
# @param {Integer} start_row
# @param {Integer} start_column
# @return {Integer}
def find_paths(m, n, max_move, start_row, start_column)
    return 0 if max_move.zero?

    mod = 1000000007
    directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    dp = Array.new(2) { Array.new(m) { Array.new(n, 0) } }
    flag = 0
    
    (1...max_move).each do |i|
        flag = 1 - flag
        (0...m).each do |r|
            (0...n).each do |c|
                dp[flag][r][c] = 0
                directions.each do |(x, y)|
                    _r = r + x
                    _c = c + y
                    if _r < 0 || _c < 0 || _r >= m || _c >= n
                        dp[flag][r][c] += 1
                    else
                        dp[flag][r][c] += dp[1-flag][_r][_c]
                    end
                    dp[flag][r][c] %= mod
                end
            end
        end
    end

    flag = 1 - flag
    dp[flag][start_row][start_column] = 0
    directions.each do |(x, y)|
        _r = start_row + x
        _c = start_column + y
        if _r < 0 || _c < 0 || _r >= m || _c >= n
            dp[flag][start_row][start_column] += 1
        else
            dp[flag][start_row][start_column] += dp[1-flag][_r][_c]
        end
        dp[flag][start_row][start_column] %= mod
    end

    dp[flag][start_row][start_column]
end
