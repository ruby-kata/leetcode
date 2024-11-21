# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} guards
# @param {Integer[][]} walls
# @return {Integer}
def count_unguarded(m, n, guards, walls)
    count = m * n
    directions = [[0,1], [0,-1], [1,0], [-1,0]].freeze
    grid = Array.new(m) { Array.new(n, 0) }
    
    walls.each { |r, c| 
        grid[r][c] = 2
        count -= 1
    }

    guards.each { |r, c|
        count -= 1
        grid[r][c] = 2
    }

    guards.each { |r, c|
        directions.each { |dr, dc|
            next_r = r + dr
            next_c = c + dc
            while next_r >= 0 && next_r < m && next_c >= 0 && next_c < n && grid[next_r][next_c] <= 1
                if grid[next_r][next_c] == 0
                    grid[next_r][next_c] = 1
                    count -= 1
                end
                next_r += dr
                next_c += dc
            end
        }
    }

    count
end
