# @param {Integer} k
# @param {Integer[][]} row_conditions
# @param {Integer[][]} col_conditions
# @return {Integer[][]}
def build_matrix(k, row_conditions, col_conditions)
    matrix = Array.new(k) { Array.new(k, 0) }

    row_order = topological_sort(k, adj_matrix(row_conditions))
    return [] if row_order.empty?

    col_order = topological_sort(k, adj_matrix(col_conditions))
    return [] if col_order.empty?

    col_order_map = col_order.map.with_index { |c, i| [c, i] }.to_h
    row_order.each_with_index { |r, i|
        matrix[i][col_order_map[r]] = r
    }

    matrix
end

def adj_matrix(edges)
    adj = Hash.new { |h, k| h[k] = [] }
    edges.each { |u, v|
        adj[u] << v
    }

    adj
end

def topological_sort(n, adj)
    # Kahn algorithm
    indegrees = Array.new(n+1) { 0 }
    adj.values.each { |a|
        a.each { |v|
            indegrees[v] += 1
        }
    }

    order = []
    queue = (1..n).select { |i| indegrees[i].zero? }
    until queue.empty?
        u = queue.pop
        order.push(u)
        adj[u].each { |v|
            indegrees[v] -= 1
            if indegrees[v].zero?
                queue.push(v)
            end
        }
    end

    # detect cycle
    return [] if order.size != n

    order
end
