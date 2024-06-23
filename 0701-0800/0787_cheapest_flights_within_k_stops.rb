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

# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
def find_cheapest_price(n, flights, src, dst, k)
    adj = Hash.new { |h, k| h[k] = [] }
    flights.each do |(f, t, p)|
        adj[f] << [t, p]
    end

    dist = Array.new(n) { Array.new(k+2, Float::INFINITY) }
    dist[src][1] = 0
    
    queue = MinHeap.new
    queue.add([0, src, 0])
    until queue.empty?
        cost, node, stops = queue.extract_min
        return cost if node == dst
        next if stops > k

        adj[node].each do |(t, p)|
            if cost + p < dist[t][stops+1]
                dist[t][stops+1] = cost + p
                queue.add([dist[t][stops+1], t, stops + 1])
            end
        end
    end

    -1
end
