class UnionFind
    def initialize(n)
        @linked = (0..n).to_a
    end

    def find(x)
        @linked[x] = find(@linked[x]) if x != @linked[x]
        @linked[x]
    end

    def union(x, y)
        return if (x_set = find(x)) == (y_set = find(y))

        @linked[x_set] = @linked[y_set]
    end

    def num_of_sets
        @linked[1..].map { |x| find(x) }.tally.size
    end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def max_num_edges_to_remove(n, edges)
    adj = Array.new(3) { [] }
    edges.each { |type, u, v|
        adj[type-1] << [u, v]
    }

    removed_edges = 0
    alice_uf = UnionFind.new(n)
    bob_uf = UnionFind.new(n)

    adj[2].each { |u, v|
        a = alice_uf.union(u, v)
        b = bob_uf.union(u, v)
        removed_edges += 1 unless a && b
    }

    adj[1].each { |u, v|
        removed_edges += 1 unless bob_uf.union(u, v)
    }

    adj[0].each { |u, v|
        removed_edges += 1 unless alice_uf.union(u, v)
    }

    (alice_uf.num_of_sets == 1 && bob_uf.num_of_sets == 1) ? removed_edges : -1
end
