# @param {Integer[][]} grid
# @return {Integer}
def largest_island(grid)
    directions = [[1,0],[-1,0],[0,1],[0,-1]].freeze
    rows = grid.size
    cols = grid[0].size
    uf = UnionFind.new(rows * cols)
    (0...rows).each { |r|
        (0...cols).each { |c|
            next if grid[r][c] == 0

            index = r * cols + c
            directions.each { |dr, dc|
                _r = r + dr
                _c = c + dc
                if _r >= 0 && _r < rows && _c >= 0 && _c < cols && grid[_r][_c] == 1
                    uf.union(index, _r * cols + _c)
                end
            }
        }
    }

    max = 0
    (0...rows).each { |r|
        (0...cols).each { |c|
            next if grid[r][c] == 1

            index = r * cols + c
            roots = []
            directions.each { |dr, dc|
                _r = r + dr
                _c = c + dc
                if _r >= 0 && _r < rows && _c >= 0 && _c < cols && grid[_r][_c] == 1
                    roots << uf.find(_r * cols + _c)
                end
            }
            
            sum = roots.uniq.sum { |r| uf.size(r) }
            max = [max, sum + 1].max
        }
    }

    [max, uf.max_size].max
end

class UnionFind
    attr_reader :indexes, :sizes

    def initialize(n)
        @indexes = (0...n).to_a
        @sizes = Array.new(n, 1)
    end

    def find(x)
        @indexes[x] = find(@indexes[x]) if x != @indexes[x]
        @indexes[x]
    end

    def union(x, y)
        _x = find(x)
        _y = find(y)
        return if _x == _y

        @indexes[_x] = _y
        @sizes[_y] += @sizes[_x]
    end

    def size(x)
        @sizes[find(x)]
    end

    def max_size
        @sizes.max
    end
end
