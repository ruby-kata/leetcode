# @param {Integer[][]} grid
# @return {Integer}
def find_max_fish(grid)
    directions = [[0,1], [0,-1], [1,0], [-1,0]].freeze
    rows = grid.length.freeze
    cols = grid[0].length.freeze

    dfs = lambda { |i, j|
        return 0 if grid[i][j] == 0

        count = grid[i][j]
        grid[i][j] = 0
        directions.each { |(di, dj)|
            _i = i + di
            _j = j + dj
            if _i >= 0 && _i < rows && _j >= 0 && _j < cols
                count += dfs.call(_i, _j)
            end
        }

        count
    }

    max = 0
    (0...rows).each { |r|
        (0...cols).each { |c|
            max = [max, dfs.call(r, c)].max if grid[r][c] > 0
        }
    }

    max
end
