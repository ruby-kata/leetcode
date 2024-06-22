# @param {Integer[][]} grid
# @param {Integer} k
# @return {Integer[][]}
def shift_grid(grid, k)
    return grid if k == 0

    nums = grid.flatten.rotate(-k)

    rows_size = grid.length
    cols_size = grid[0].length
    (0...rows_size).each do |r|
        (0...cols_size).each do |c|
            grid[r][c] = nums[r * cols_size + c]
        end
    end

    grid
end
