# @param {Integer[][]} stones
# @return {Integer}
def remove_stones(stones)
    dfs = lambda { |i|
        x, y = stones[i]
        stones[i] = nil
        count = 1
        (0...stones.size).each { |j|
            next if stones[j].nil?

            _x, _y = stones[j]
            count += dfs.call(j) if x == _x || y == _y
        }

        count
    }

    count = 0
    (0...stones.size).each { |i|
        next if stones[i].nil?
        count += dfs.call(i) - 1
    }

    count
end

# UnionFind
def remove_stones(stones)
    uf = UnionFind.new(stones.size)
    count = 0
    (0...stones.size).each { |i|
        (0...stones.size).each { |j|
            if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1]
                count += 1 if uf.union(i, j)
            end
        }
    }

    count
end

# UnionFind optimize
def remove_stones(stones)
    max_size = 10001
    uf = UnionFind.new(max_size * 2)
    stones.each { |(x, y)|
        # since y + max_size always > x
        # in union the index of x always points to the index of y+max_size
        # the index of y+max_size will always points to the larger y+max_size
        # hence those stones have same x or y always belong to the same group with the root is the largest {y+max_size}
        uf.union(x, y + max_size)
    }

    # each group always must keep the root
    # so removed-stones = total-stones - keep-root-stones
    stones.size - stones.map { |(x, y)| uf.find(x) }.tally.size
end

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
        return false if _x == _y

        _x < _y ? @indexes[_y] = _x : @indexes[_x] = _y
        true
    end
end
