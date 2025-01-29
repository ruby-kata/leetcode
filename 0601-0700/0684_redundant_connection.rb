# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
    uf = UnionFind.new(edges.size)
    edges.each { |u, v|
        return [u, v] if uf.find(u) == uf.find(v)

        uf.union(u, v)
    }
end

class UnionFind
    attr_reader :indexes

    def initialize(n)
        @indexes = (0..n).to_a
    end

    def find(x)
        @indexes[x] = find(@indexes[x]) if x != @indexes[x]
        @indexes[x]
    end

    def union(x, y)
        @indexes[find(y)] = find(x)
    end
end
