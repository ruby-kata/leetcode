# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
    rows = matrix.size.freeze
    cols = matrix[0].size.freeze
    directions = [[1,0], [-1,0], [0,1], [0,-1]].freeze
    memo = Array.new(rows) { Array.new(cols) }
    dfs = lambda { |r, c|
        return memo[r][c] if memo[r][c]
        
        max = 1
        directions.each { |dr, dc|
            next_r = r + dr
            next_c = c + dc
            if next_r >= 0 && next_c >= 0 && next_r < rows && next_c < cols && matrix[r][c] < matrix[next_r][next_c]
                max = [max, 1 + dfs.call(next_r, next_c)].max
            end
        }
        memo[r][c] = max
    }

    longest = 0
    (0...rows).each { |r|
        (0...cols).each { |c|
            longest = [longest, dfs.call(r, c)].max
        }
    }

    longest
end
