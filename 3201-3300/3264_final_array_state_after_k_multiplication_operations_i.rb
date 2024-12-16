# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} multiplier
# @return {Integer[]}
def get_final_state(nums, k, multiplier)
    k.times do
        i = nums.index(nums.min)
        nums[i] *= multiplier
    end

    nums
end

# using min-heap
def get_final_state(nums, k, multiplier)
    min_heap = MinHeap.new
    nums.each_with_index { |num, i| min_heap.add([num, i]) }

    k.times do
        num, i = min_heap.extract_min
        modified_num = num * multiplier
        min_heap.add([modified_num, i])
        nums[i] = modified_num
    end

    nums
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
