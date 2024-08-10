# @param {Integer} n
# @param {Integer} threshold
# @param {Integer[][]} queries
# @return {Boolean[]}
def are_connected(n, threshold, queries)
    uf = UnionFind.new(n)
    (threshold+1..n).each { |i|
        j = i * 2
        while j <= n
            uf.union(i, j)
            j += i
        end
    }

    queries.map { |(x, y)| uf.union?(x, y) }
end

class UnionFind
    def initialize(n)
        @labels = (0..n+1).to_a
    end

    def find(x)
        @labels[x] = find(@labels[x]) if x != @labels[x]
        @labels[x]
    end

    def union(x, y)
        label_x = find(x)
        label_y = find(y)
        @labels[label_x] = label_y
    end

    def union?(x, y)
        find(x) == find(y)
    end
end
