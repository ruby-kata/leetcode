# brute-force
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


# optimize solution
# idea: finding the Articulation Point (or Cut Vertice)
# if it exists then it's the land cell we need to remove
def min_days(grid)
    visited = Array.new(grid.length) { Array.new(grid[0].length, false) }
    discovered = Array.new(grid.length) { Array.new(grid[0].length, 0) }
    low = Array.new(grid.length) { Array.new(grid[0].length, 0) }
    t = 0
    dirs = [[0,1],[0,-1],[1,0],[-1,0]]

    # finding the Articulation Point
    # Tarjan's approach O(V + E)
    dfs_ap = lambda { |r, c, pr, pc|
        visited[r][c] = true
        found_ap = false
        children = 0
        t += 1
        low[r][c] = t
        discovered[r][c] = t
        dirs.each { |(dx, dy)|
            dr = r + dx
            dc = c + dy
            next if dr < 0 || dr >= grid.length || dc < 0 || dc >= grid[0].length

            visited[dr][dc] = true
            next if (dr == pr && dc == pc) || grid[dr][dc].zero?

            if discovered[dr][dc] == 0
                children += 1
                find_ap = dfs_ap.call(dr, dc, r, c)
                found_ap ||= find_ap
                found_ap ||= pr != -1 && discovered[r][c] <= low[dr][dc]
                low[r][c] = [low[r][c], low[dr][dc]].min
            else
                low[r][c] = [low[r][c], discovered[dr][dc]].min
            end
        }

        found_ap || (pr == -1 && children > 1)
    }

    lands_count = 0
    count = 0
    found_ap = false
    (0...grid.length).each { |r|
        (0...grid[0].length).each { |c|
            next if grid[r][c] == 0
            # if there're more than one lands, grid is already disconnected
            return 0 if lands_count >= 1 && !visited[r][c]
            
            count += 1
            if discovered[r][c] == 0 # not discoverd yet
                lands_count += 1
                # run dfs from r,c to traversal all 1 cells
                # and detect if there's an Articulation Point
                found_ap ||= dfs_ap.call(r, c, -1, -1)
            end
        }
    }

    # if there's only 2 cell lands
    # we need to remove both of them.
    # if found AP then remove that AP will make disconnected, so return 1.
    # if not found AP and number of lands > 2, 
    # there's always has a land that have 2 other connected-lands,
    # otherise, each island has at least 3-connected, it's impossible in this case,
    # where a island has maximal 2-connected on horizontal or vertical,
    # so remove that 2 connected-lands will make disconnected.
    found_ap && count > 2 ? 1 : [count, 2].min
end
