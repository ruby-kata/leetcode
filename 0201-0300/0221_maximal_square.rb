# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
    max_len = 0
    rows = matrix.length
    cols = matrix[0].length
    dp = Array.new(2) { Array.new(cols + 1, 0) }
    curr = 0
    (rows - 1).downto(0).each { |r|
        curr = 1 - curr
        (cols - 1).downto(0).each { |c|
            if matrix[r][c] == "1"
                dp[curr][c] = [dp[1-curr][c], dp[curr][c+1], dp[1-curr][c+1]].min + 1
                max_len = [max_len, dp[curr][c]].max
            else
                dp[curr][c] = 0
            end
        }
    }

    max_len * max_len
end
