# @param {Integer[][]} matrix
# @return {Integer}
def min_falling_path_sum(matrix)
    cols = matrix[0].size
    min_sums = [matrix.last.clone, Array.new(cols, 0)]
    flag = 0

    (matrix.size-2).downto(0) do |i|
        flag = 1 - flag
        (0...cols).each do |j|
            min_sums[flag][j] = matrix[i][j] + [
                min_sums[1-flag][j],
                j > 0 ? min_sums[1-flag][j-1] : Float::INFINITY,
                j < cols-1 ? min_sums[1-flag][j+1] : Float::INFINITY
            ].min
        end
    end

    min_sums[flag].min
end
