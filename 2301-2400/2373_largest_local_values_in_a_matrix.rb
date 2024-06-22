# @param {Integer[][]} grid
# @return {Integer[][]}
def largest_local(grid)
    rows_size = grid.length
    cols_size = grid[0].length
    largest = Array.new(rows_size - 2) { Array.new(cols_size - 2, 0) }
    (0..rows_size-3).each do |r|
        (0..cols_size-3).each do |c|
            max = 0
            (r..r+2).each do |i|
                (c..c+2).each do |j|
                    max = grid[i][j] if max < grid[i][j]
                end
            end

            largest[r][c] = max
        end
    end

    largest
end
