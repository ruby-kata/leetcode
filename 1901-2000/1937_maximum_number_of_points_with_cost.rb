# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
    rows = points.size
    cols = points.first.size
    dp = Array.new(2) { Array.new(cols, 0) }
    curr = 0

    (0...rows).each { |r|
        curr = 1 - curr
        
        max = -Float::INFINITY
        (0...cols).each { |c|
            max = [max, dp[1-curr][c] + c].max
            dp[curr][c] = [dp[curr][c], points[r][c] + max - c].max
        }

        max = -Float::INFINITY
        (cols-1).downto(0) { |c|
            max = [max, dp[1-curr][c] - c].max
            dp[curr][c] = [dp[curr][c], points[r][c] + max + c].max
        }
    }

    dp[curr].max
end
