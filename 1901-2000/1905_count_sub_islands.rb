# @param {Integer[][]} grid1
# @param {Integer[][]} grid2
# @return {Integer}
def count_sub_islands(grid1, grid2)
    rows = grid1.size
    cols = grid1[0].size
    dirs = [[0,1], [0,-1], [1,0], [-1,0]].freeze
    count = 0

    dfs = lambda { |r, c|
        grid2[r][c] = 0 # visited
        island = grid1[r][c]
        dirs.each { |(dr, dc)|
            _r = r + dr
            _c = c + dc

            if _r >= 0 && _r < rows && _c >= 0 && _c < cols && grid2[_r][_c] == 1 # not visited
                island = 0 if dfs.call(_r, _c).zero?
            end
        }
        island
    }


    (0...rows).each { |r|
        (0...cols).each { |c|
            count += dfs.call(r, c) if grid2[r][c] == 1
        }
    }

    count
end
