# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
    m = grid.length
    n = grid[0].length
    min = Array.new(2) { Array.new(n + 1, Float::INFINITY) }
    min[cur = 0][n-1] = 0
    
    (m-1).downto(0) do |i|
        cur = 1 - cur
        (n-1).downto(0) do |j|
            min[cur][j] = [min[cur][j+1], min[1-cur][j]].min + grid[i][j]
        end
    end

    min[cur][0]
end
