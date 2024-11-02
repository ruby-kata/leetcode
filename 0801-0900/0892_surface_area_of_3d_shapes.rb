# @param {Integer[][]} grid
# @return {Integer}
def surface_area(grid)
    rows = grid.length
    cols = grid[0].length

    count = 0
    (0...rows).each { |r|
        (0...cols).each { |c|
            next if grid[r][c].zero?

            count += [grid[r][c] - (r <= 0 ? 0 : grid[r-1][c]), 0].max
            count += [grid[r][c] - (c <= 0 ? 0 : grid[r][c-1]), 0].max
            count += [grid[r][c] - (r >= rows-1 ? 0 : grid[r+1][c]), 0].max
            count += [grid[r][c] - (c >= cols-1 ? 0 : grid[r][c+1]), 0].max
            count += 2
        }
    }

    count
end
