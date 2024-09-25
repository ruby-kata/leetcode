class NeighborSum
    def initialize(grid)
        @grid = grid
        @rows = @grid.length
        @cols = @grid[0].length
        @indexes = Hash.new
        (0...@rows).each { |i|
            (0...@cols).each { |j|
                @indexes[grid[i][j]] = [i, j]
            }
        }
    end
    
    def adjacent_sum(value)
        i, j = @indexes[value]
        sum = 0
        sum += @grid[i-1][j] if i >= 1
        sum += @grid[i+1][j] if i < @rows - 1
        sum += @grid[i][j-1] if j >= 1
        sum += @grid[i][j+1] if j < @cols - 1
        sum
    end
    
    def diagonal_sum(value)
        i, j = @indexes[value]
        sum = 0
        sum += @grid[i-1][j-1] if i >= 1 && j >= 1
        sum += @grid[i+1][j+1] if i < (@rows - 1) && j < (@cols - 1)
        sum += @grid[i+1][j-1] if j >= 1 && i < @rows - 1
        sum += @grid[i-1][j+1] if i >= 1 && j < @cols - 1
        sum
    end
end
