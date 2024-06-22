# @param {Integer[][]} grid
# @return {Integer[][]}
def ones_minus_zeros(grid)
    row_sums = Array.new(grid.size, 0)
    col_sums = Array.new(grid[0].size, 0)
    (0...grid.size).each do |r|
        (0...grid[0].size).each do |c|
            d = grid[r][c] > 0 ? 1 : -1
            row_sums[r] += d
            col_sums[c] += d
        end
    end

    diff = Array.new(grid.size) { Array.new(grid[0].size, 0) }
    (0...grid.size).each do |r|
        (0...grid[0].size).each do |c|
            diff[r][c] = row_sums[r] + col_sums[c]
        end
    end

    diff
end
