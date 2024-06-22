def calculate_min_manhattan_distance(grid)
    len = grid.length
    dist = Array.new(len) { Array.new(len, Float::INFINITY) }
    queue = []
    (0...len).each do |i|
        (0...len).each do |j|
            if grid[i][j] == 1
                dist[i][j] = 0
                queue.push([i, j])
            end
        end
    end

    until queue.empty?
        i, j = queue.shift

        if i < len-1 && dist[i+1][j] == Float::INFINITY
            dist[i+1][j] = dist[i][j] + 1
            queue.push([i+1, j])
        end

        if i > 0 && dist[i-1][j] == Float::INFINITY
            dist[i-1][j] = dist[i][j] + 1
            queue.push([i-1, j])
        end
 
        if j < len-1 && dist[i][j+1] == Float::INFINITY
            dist[i][j+1] = dist[i][j] + 1
            queue.push([i, j+1])
        end

        if j > 0 && dist[i][j-1] == Float::INFINITY
            dist[i][j-1] = dist[i][j] + 1
            queue.push([i, j-1])
        end
    end

    dist
end

#
# BFS + Binary Search
# Time Limit Exceeded
#
def find_path(safeness_factor, dist)
    return false if dist[0][0] < safeness_factor

    len = dist.length
    found = false
    visited = {}
    queue = [[0,0]]
    visited[[0, 0]] = true
    until queue.empty?
        i, j = queue.shift
        if i == len - 1 && j == len - 1
            found = true
            break
        end
        
        if i < len-1 && !visited[[i+1, j]] && dist[i+1][j] >= safeness_factor
            queue.push([i+1, j]) 
            visited[[i+1,j]] = true
        end
        
        if i > 0 && !visited[[i-1, j]] && dist[i-1][j] >= safeness_factor
            queue.push([i-1, j])
            visited[[i-1,j]] = true
        end

        if j < len-1 && !visited[[i, j+1]] && dist[i][j+1] >= safeness_factor
            queue.push([i, j+1])
            visited[[i,j+1]] = true
        end

        if j > 0 && !visited[[i, j-1]] && dist[i][j-1] >= safeness_factor
            queue.push([i, j-1])
            visited[[i,j-1]] = true
        end
    end

    found
end

# @param {Integer[][]} grid
# @return {Integer}
def maximum_safeness_factor(grid)
    return 0 if grid[0][0] == 1
    
    min_dist = calculate_min_manhattan_distance(grid)    

    l = 0
    h = grid.length + grid.length
    while l < h
        m = (l + h) / 2
        if find_path(m, min_dist)
            l = m + 1
        else
            h = m
        end
    end

    l - 1
end

#
# BFS + UNION FIND
# Time Limit Exceeded
#
class UnionFind
    def initialize(size)
        @link = (0...size).to_a
        @size = Array.new(size, 1)
    end

    def find(x)
        @link[x] = find(@link[x]) if x != @link[x]
        @link[x]
    end

    def union(x, y)
        _x = find(x)
        _y = find(y)

        return false if _x == _y
        
        if @size[_x] > @size[_y]
            @link[_y] = _x
            @size[_x] += @size[_y]
        else
            @link[_x] = _y
            @size[_y] += @size[_x]
        end

        true
    end
end

def maximum_safeness_factor(grid)
    len = grid.length
    return 0 if grid[0][0] == 1 || grid[len-1][len-1] == 1
    
    dist = calculate_min_manhattan_distance(grid)

    flat_dist_with_index = []
    (0...len).each do |i|
        (0...len).each do |j|
            flat_dist_with_index.push([dist[i][j], i, j])
        end
    end

    flat_dist_with_index.sort!.reverse!

    uf = UnionFind.new(flat_dist_with_index.length)
    flat_dist_with_index.each do |d, i, j|
        cell_flat_index = i*len + j

        if i < len-1 && dist[i+1][j] >= d
            uf.union(cell_flat_index, cell_flat_index + len)
        end

        if i > 0 && dist[i-1][j] >= d
            uf.union(cell_flat_index, cell_flat_index - len)
        end
 
        if j < len-1 && dist[i][j+1] >= d
            uf.union(cell_flat_index, cell_flat_index + 1)
        end

        if j > 0 && dist[i][j-1] >= d
            uf.union(cell_flat_index, cell_flat_index - 1)
        end

        return d if uf.find(0) == uf.find(flat_dist_with_index.length-1)
    end

    0
end