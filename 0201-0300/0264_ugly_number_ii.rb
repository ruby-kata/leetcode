# ------------------------------------------------
# use Dynamic Programming
# ------------------------------------------------
# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
    ugly_nums = Array.new(n, 1) 
    next_by_min_2 = next_by_min_3 = next_by_min_5 = 0
    (1...n).each do |i|
        # the next ugly number should be the minimum among:
        # the minimum previous *2-ugly-numbers those multiple by 2
        # the minimum previous *3-ugly-numbers those multiple by 3
        # the minimum previous *5-ugly-numbers those multiple by 5
        min_2 = ugly_nums[next_by_min_2] * 2
        min_3 = ugly_nums[next_by_min_3] * 3
        min_5 = ugly_nums[next_by_min_5] * 5
        curr_min = [min_2, min_3, min_5].min
        ugly_nums[i] = curr_min

        # the next minimum *2-ugly-number should be 
        # (the ugly number next by the current *2-ugly-number) * 2
        next_by_min_2 += 1 if curr_min == min_2
        # same as above
        next_by_min_3 += 1 if curr_min == min_3
        # same as above
        next_by_min_5 += 1 if curr_min == min_5
            
    end

    ugly_nums[n-1]
end

# ------------------------------------------------
# use MinHeap
# ------------------------------------------------
def nth_ugly_number(n)
    min_heap = MinHeap.new
    min_heap.add(1)
    ans = 0
    i = 0
    while i < n
        min_ugly = min_heap.extract_min
        if ans < min_ugly # ignore duplicate
            min_heap.add(min_ugly * 2)
            min_heap.add(min_ugly * 3)
            min_heap.add(min_ugly * 5)
            ans = min_ugly
            i += 1
        end
    end

    ans
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