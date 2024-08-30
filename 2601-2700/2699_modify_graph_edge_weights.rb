# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} source
# @param {Integer} destination
# @param {Integer} target
# @return {Integer[][]}
def modified_graph_edges(n, edges, source, destination, target)
    max = 2 * 10**9
    graph = Hash.new { |h, k| h[k] = Hash.new(Float::INFINITY) }    

    edges.each { |edge|
        graph[edge[0]][edge[1]] = graph[edge[1]][edge[0]] = edge[2] == -1 ? 1 : edge[2]
    }

    min_cost = dijkstra(source, destination, n, graph)
    # Hint 3
    # If the shortest path including the edges to be modified (weight of 1), is greater than the target, 
    # then it is also not possible.
    return [] if min_cost > target

    if min_cost == target
        edges.each { |edge| edge[2] = edge[2] == -1 ? 1 : edge[2] }
        return edges
    end

    edges.each { |edge|
        edge[2] = edge[2] == -1 ? max : edge[2]
        graph[edge[0]][edge[1]] = edge[2]
        graph[edge[1]][edge[0]] = edge[2]
    }

    min_cost = dijkstra(source, destination, n, graph)
    # Hint 2
    # If the shortest path without the edges to be modified, is less than the target, then it is not possible.
    # (note that when we set -1 edges to max, the shortest path will nerver contain them, so we can consider that we not modifying them)
    return [] if min_cost < target
    return edges if min_cost == target

    edges.each { |edge|
        if edge[2] == max
            edge[2] = 1
            graph[edge[0]][edge[1]] = edge[2]
            graph[edge[1]][edge[0]] = edge[2]

            min_cost = dijkstra(source, destination, n, graph)
            if min_cost <= target
                edge[2] += target - min_cost
                break
            end
        end
    }

    min_cost > target ? [] : edges
end

def dijkstra(source, destination, n, graph)
    dist = Array.new(n, Float::INFINITY)
    dist[source] = 0
    queue = MinHeap.new
    queue.add([0, source])

    until queue.empty?
        cost, u = queue.extract_min
        return cost if u == destination
        
        graph[u].each { |v, w|
            if dist[v] > cost + w
                dist[v] = cost + w
                queue.add([dist[v], v])
            end
        }
    end
    dist[destination]
end

class MinHeap
    def initialize
        @items = []
    end

    def add(x)
        @items.push(x)
        swim_up(@items.size-1)
    end

    def extract_min
        return if empty?

        swap(0, @items.size-1)
        min = @items.pop()
        sink_down(0)
        min
    end

    def empty?
        @items.empty?
    end

    private

        def swap(i, j)
            temp = @items[i]
            @items[i] = @items[j]
            @items[j] = temp
        end

        def sink_down(i)
            return if (l = 2*i + 1) >= @items.size
            r = l + 1

            min = (@items[l] <=> @items[r] || 0) <= 0 ? l : r
            if (@items[min] <=> @items[i]) < 0
                swap(min, i)
                sink_down(min)
            end
        end

        def swim_up(i)
            return if (p = (i-1)/2) < 0
            if (@items[i] <=> @items[p]) < 0
                swap(i, p)
                swim_up(p)
            end
        end
end
