# @param {Integer[][]} nums
# @return {Integer[]}
def smallest_range(nums)
    min_heap = MinHeap.new
    max = -Float::INFINITY
    min = Float::INFINITY
    
    nums.each_with_index { |arr, i|
        num = arr[0]
        min_heap.add([num, i, 0])
        min = [min, num].min
        max = [max, num].max
    }

    min_range = min
    max_range = max

    while min_heap.size == nums.size
        num, i, j = min_heap.extract_min
        if j + 1 < nums[i].size
            min_heap.add([nums[i][j+1], i, j + 1])
            max = [max, nums[i][j+1]].max
            min = min_heap.peak.first
            if max - min < max_range - min_range
                min_range, max_range = min, max
            end
        end
    end

    [min_range, max_range]
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

    def peak
        @items.first
    end

    def empty?
        @items.empty?
    end

    def size
        @items.size
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
