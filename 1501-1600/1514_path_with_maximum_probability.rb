# @param {Integer} n
# @param {Integer[][]} edges
# @param {Float[]} succ_prob
# @param {Integer} start_node
# @param {Integer} end_node
# @return {Float}
def max_probability(n, edges, succ_prob, start_node, end_node)
    graph = Hash.new { |h, k| h[k] = [] }
    edges.each_with_index { |(a, b), i|
        graph[a] << [succ_prob[i], b]
        graph[b] << [succ_prob[i], a]
    }

    min_heap = MinHeap.new
    min_heap.add([-1, start_node])
    probs = Array.new(n, Float::INFINITY)
    until min_heap.empty?
        min_neg_prob, max_node = min_heap.extract_min
        return -min_neg_prob if max_node == end_node

        graph[max_node].each { |(next_prob, next_node)|
            if (next_min_neg_prob = min_neg_prob * next_prob) < probs[next_node]
                probs[next_node] = next_min_neg_prob
                min_heap.add([next_min_neg_prob, next_node])
            end
        }
    end

    0
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
