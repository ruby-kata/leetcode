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

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
    min_heap = MinHeap.new
    (0..[nums2.size-1, k].min).each do |j|
        min_heap.add([nums1[0] + nums2[j], [0, j]])
    end

    ans = []
    until k <= 0 or min_heap.empty?
        min_sum, (i, j) = min_heap.extract_min
        ans << [nums1[i], nums2[j]]
        
        min_heap.add([nums1[i+1] + nums2[j], [i+1, j]]) if i < nums1.size-1
        k -= 1
    end

    ans
end
