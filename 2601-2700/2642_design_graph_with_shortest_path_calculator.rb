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

class Graph
    def initialize(n, edges)
        @size = n
        @adj = Hash.new { |h, k| h[k] = [] }
        edges.each do |edge|
            add_edge(edge)
        end
    end

    def add_edge(edge)
        f, t, cost = edge
        @adj[f] << [cost, t]
    end

    def shortest_path(node1, node2)
        min_cost = MinHeap.new
        f, t = node1, node2
        min_cost.add([0, f])

        dist = Array.new(@size, Float::INFINITY)
        dist[f] = 0
        until min_cost.empty?
            cost, node = min_cost.extract_min
            return cost if node == t

            @adj[node].each do |(c, next_node)|
                if cost + c < dist[next_node]
                    dist[next_node] = cost + c
                    min_cost.add([dist[next_node], next_node])
                end
            end
        end

        -1
    end
end

# slower
class Graph
    def initialize(n, edges)
        @size = n
        @min_costs = Array.new(n) { Array.new(n, Float::INFINITY) }
        (0...@size).each do |i|
            @min_costs[i][i] = 0
        end

        edges.each do |edge|
            add_edge(edge)
        end
    end

    def add_edge(edge)
        f, t, cost = edge
        (0...@size).each do |i|
            (0...@size).each do |j|
                @min_costs[i][j] = [@min_costs[i][j], @min_costs[i][f] + cost + @min_costs[t][j]].min
            end
        end
    end

    def shortest_path(node1, node2)
        @min_costs[node1][node2] == Float::INFINITY ? -1 : @min_costs[node1][node2]
    end
end
