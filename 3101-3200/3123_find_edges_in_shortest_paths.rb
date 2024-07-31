# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean[]}
def find_answer(n, edges)
    adj = Hash.new { |h, k| h[k] = [] }
    edges.each { |u, v, w|
        adj[u] << [v, w]
        adj[v] << [u, w]
    }

    min_cost_from_source = dijkstra(adj, n, 0)
    min_cost_from_target = dijkstra(adj, n, n-1)

    edges.map { |u, v, w|
        min_cost_from_source[n-1] < Float::INFINITY &&
        (min_cost_from_source[u] + w + min_cost_from_target[v] == min_cost_from_source[n-1] ||
            min_cost_from_source[v] + w + min_cost_from_target[u] == min_cost_from_source[n-1])
    }
end

# https://en.wikipedia.org/wiki/Dijkstra's_algorithm
def dijkstra(graph, n, source)
    dist = Array.new(n, Float::INFINITY)
    dist[source] = 0

    queue = MinHeap.new
    queue.add([0, source])
    until queue.empty?
        cost, v = queue.extract_min
        next if cost > dist[v]
        
        graph[v].each { |u, w|
            alt = dist[v] + w
            if dist[u] > alt
                dist[u] = alt
                queue.add([alt, u])
            end
        }
    end

    dist
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
