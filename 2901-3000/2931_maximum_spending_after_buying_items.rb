# @param {Integer[][]} values
# @return {Integer}
def max_spending(values)
    min_heap = MinHeap.new
    values.each_with_index { |items, i|
        min_heap.add([items.pop, i])
    }

    sum = 0
    d = 1
    until min_heap.empty?
        v, i = min_heap.extract_min
        sum += d * v
        d += 1
        min_heap.add([values[i].pop, i]) unless values[i].empty?
    end

    sum
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
        return if @items.empty?

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
