# @param {Integer[]} row_sum
# @param {Integer[]} col_sum
# @return {Integer[][]}
def restore_matrix(row_sum, col_sum)
    row_size = row_sum.size
    col_size = col_sum.size
    matrix = Array.new(row_size) { Array.new(col_size) }
    (0...row_size).each { |r|
        (0...col_size).each { |c|
            matrix[r][c] = [row_sum[r], col_sum[c]].min
            row_sum[r] -= matrix[r][c]
            col_sum[c] -= matrix[r][c]
        }
    }

    matrix
end
