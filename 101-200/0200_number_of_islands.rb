class UnionFind
    attr_reader :indexes

    def initialize(n)
        @indexes = (0...n).to_a
    end

    def find(x)
        @indexes[x] = find(@indexes[x]) if x != @indexes[x]
        @indexes[x]
    end

    def union(x, y)
        _x = find(x)
        _y = find(y)

        _x < _y ? @indexes[_y] = _x : @indexes[_x] = _y
    end

    def uniq
        @indexes.map { |i| find(i) }.uniq
    end
end

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    rows = grid.length
    cols = grid[0].length
    islands = UnionFind.new(rows * cols)

    (0...rows).each do |r|
        (0...cols).each do |c|
            if grid[r][c] == "1"
                i = r * cols + c
                if r > 0 && grid[r-1][c] == "1"
                    top = i - cols
                    islands.union(i, top)
                end

                if r < rows-1 && grid[r+1][c] == "1"
                    bot = i + cols
                    islands.union(i, bot)
                end

                if c > 0 && grid[r][c-1] == "1"
                    left = i - 1
                    islands.union(i, left)
                end

                if c < cols-1 && grid[r][c+1] == "1"
                    right = i + 1
                    islands.union(i, right)
                end
            end
        end
    end

    islands.uniq.count { |i| grid[i/cols][i%cols] == "1" }
end
