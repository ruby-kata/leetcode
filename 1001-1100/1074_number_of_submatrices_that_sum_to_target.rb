# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Integer}
def num_submatrix_sum_target(matrix, target)
    r = matrix.size
    c = matrix[0].size
    row_sums = Array.new(r) { Array.new(c, 0) }

    (0...r).each do |i|
        (0...c).each do |j|
            row_sums[i][j] = matrix[i][j] + (j > 0 ? row_sums[i][j-1] : 0)
        end
    end

    count = 0
    (0...c).each do |start_col|
        (start_col...c).each do |end_col|
            prefix_sum = Hash.new(0)
            prefix_sum[0] = 1
            sum = 0
            (0...r).each do |row|
                sum += row_sums[row][end_col] - (start_col > 0 ? row_sums[row][start_col-1] : 0)
                count += prefix_sum[sum - target] if prefix_sum.has_key?(sum - target)
                prefix_sum[sum] += 1
            end
        end
    end

    count
end
