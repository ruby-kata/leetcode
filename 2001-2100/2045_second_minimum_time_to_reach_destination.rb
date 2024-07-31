# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} time
# @param {Integer} change
# @return {Integer}
def second_minimum(n, edges, time, change)
    adj = Hash.new { |h, k| h[k] = [] }
    edges.each { |u, v|
        adj[u] << v
        adj[v] << u
    }
    
    costs = Array.new(n+1) { [nil, nil] }
    queue = MinHeap.new
    queue.add([0, 1])
    until queue.empty?
        t, u = queue.extract_min
        wait = (t/change).odd? ? change - (t % change) : 0
        next_t = t + wait + time

        adj[u].each { |v|
            next if costs[v][1] # already reached 2 times, no need to process
            
            if costs[v][0].nil? # reach the first time
                costs[v][0] = next_t 
            else # reach the second time
                costs[v][1] = next_t if costs[v][1].nil? && costs[v][0] < next_t
            end

            return costs[v][1] if v == n && costs[v][1]

            queue.add([next_t, v])
        }
    end    
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
