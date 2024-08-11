# @param {Integer[][]} grid
# @return {Integer}
def min_days(grid)
    dfs = lambda { |i, j, visited|
        return if i < 0 || i >= grid.length || j < 0 || j >= grid[0].length
        return if grid[i][j].zero? || visited[i][j]

        visited[i][j] = true

        dfs.call(i-1, j, visited)
        dfs.call(i+1, j, visited)
        dfs.call(i, j+1, visited)
        dfs.call(i, j-1, visited)
    }

    count_islands = lambda {
        visited = Array.new(grid.length) { Array.new(grid[0].length, false) }
        count = 0
        (0...grid.length).each { |r|
            (0...grid[0].length).each { |c|
                next if grid[r][c].zero? || visited[r][c]

                count += 1
                dfs.call(r, c, visited)
            }
        }
        count
    }

    # already have > 2 islands
    return 0 if count_islands.call != 1

    # brute-force
    # try to remove each island and see if it can make island disconnected
    (0...grid.length).each { |r|
        (0...grid[0].length).each { |c|
            next if grid[r][c].zero?

            grid[r][c] = 0
            return 1 if count_islands.call != 1
            grid[r][c] = 1
        }
    }

    # if number of lands are 2, remove both of them
    # if number of lands > 2, there's always has a land that have 2 other connected-lands,
    # otherise, each island has at least 3-connected, it's impossible in this case,
    # where a island has maximal 2-connected on horizontal or vertical.

    2
end
