# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_kelements(nums, k)
    max_heap = MaxHeap.new
    nums.each { |num| max_heap.add(num) }
    k.times.reduce(0) { |sum, i|
        sum += num = max_heap.extract_max
        max_heap.add((num/3.0).ceil)
        sum
    }
end

class MaxHeap
    def initialize
        @items = []
    end

    def add(x)
        @items.push(x)
        swim_up(@items.size-1)
    end

    def extract_max
        return if empty?

        swap(0, @items.size-1)
        max = @items.pop()
        sink_down(0)
        max
    end

    def size
        @items.size
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

            max = (l == @items.length-1 || (@items[l] <=> @items[r]) >= 0) ? l : r
            if (@items[i] <=> @items[max]) < 0
                swap(max, i)
                sink_down(max)
            end
        end

        def swim_up(i)
            return if (p = (i-1)/2) < 0
            if (@items[p] <=> @items[i]) < 0
                swap(i, p)
                swim_up(p)
            end
        end
end
