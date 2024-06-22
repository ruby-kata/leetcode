# @param {Integer[][]} grid
# @return {Integer}
def get_maximum_gold(grid)
    def backtrack(i, j, grid)
        return 0 if i < 0 || i >= grid.length || j < 0 || j >= grid[0].length || grid[i][j] == 0

        g = grid[i][j]
        grid[i][j] = 0
        m = [
            backtrack(i+1, j, grid),
            backtrack(i-1, j, grid),
            backtrack(i, j+1, grid),
            backtrack(i, j-1, grid)
        ].max
        grid[i][j] = g

        g + m
    end

    max = 0
    (0...grid.length).each do |i|
        (0...grid[0].length).each do |j|
            max = [max, backtrack(i, j, grid)].max
        end
    end

    max
end
