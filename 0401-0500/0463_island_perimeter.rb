# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
    perimeter = 0
    (0...grid.length).each do |r|
        (0...grid[0].length).each do |c|
            if grid[r][c] == 1
                perimeter += 4
                perimeter -= 1 if r > 0 && grid[r-1][c] == 1
                perimeter -= 1 if r < grid.length-1 && grid[r+1][c] == 1
                perimeter -= 1 if c < grid[0].length-1 && grid[r][c+1] == 1
                perimeter -= 1 if c > 0 && grid[r][c-1] == 1
            end
        end
    end

    perimeter
end
