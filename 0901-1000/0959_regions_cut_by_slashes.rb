# @param {String[]} grid
# @return {Integer}
def regions_by_slashes(grid)
    size = grid.length
    # map each slash to three '1' squares, others are '0'
    #  0  0  1  0  0  
    #  0  1  0  1  0
    #  1  0  0  0  1 
    #  0  1  0  1  0
    #  0  0  1  0  0
    # 
    # oserved that a region is some connected '0' separeting by '1'
    # so we could count number of regions by counting regions of connected '0'
    #
    # Note: why split slash into 3, not 2
    # consider this: ["//", "//"]
    # 2        3
    # 0 1 1  | 0  0  1  0  1
    # 1 1 1  | 0  1  0  1  0
    # 1 1 0  | 1  0  1  0  1
    #        | 0  1  0  1  0
    #        | 1  0  1  0  0
    # as you can see, the right map is correct, there're 4 regions
    map = Array.new(size * 3) { Array.new(size * 3, 0) }

    i = 0
    while i < size
        j = 0
        while j < size
            if grid[i][j] == '/'
                map[i*3][j*3+2] = 1
                map[i*3+1][j*3+1] = 1
                map[i*3+2][j*3] = 1
            elsif grid[i][j] == '\\'
                map[i*3][j*3] = 1
                map[i*3+1][j*3+1] = 1
                map[i*3+2][j*3+2] = 1
            end
            j += 1
        end
        i += 1
    end

    # depth-first-search to map all connected '0' squares together and count as a region
    dfs = lambda { |i, j|
        return if i < 0 || i >= map.size || j < 0 || j >= map.size
        return if map[i][j] > 0

        map[i][j] = 1

        dfs.call(i+1, j)
        dfs.call(i-1, j)
        dfs.call(i, j+1)
        dfs.call(i, j-1)
    }

    count = 0
    (0...map.size).each { |i|
        (0...map.size).each { |j|
            if map[i][j] == 0
                dfs.call(i, j)
                count += 1
            end
        }
    }

    count
end
