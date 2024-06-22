# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def sum_of_distances_in_tree(n, edges)
    graph = Hash.new { |h, k| h[k] = [] }
    edges.each { |(u, v)|
        graph[u] << v
        graph[v] << u
    }
    
    sum = Array.new(n, 0)
    size = Array.new(n, 1)

    post_order = lambda { |u, v|
        graph[v].each { |w|
            next if w == u

            post_order.call(v, w)
            size[v] += size[w]
            sum[v] += sum[w] + size[w]
        }
    }

    pre_order = lambda { |u, v|
        graph[v].each { |w|
            next if w == u

            sum[w] = sum[v] - size[w] + n - size[w]
            pre_order.call(v, w)
        }
    }

    post_order.call(-1, 0)
    pre_order.call(-1, 0)

    sum
end
