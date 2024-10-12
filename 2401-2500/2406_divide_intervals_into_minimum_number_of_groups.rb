# @param {Integer[][]} intervals
# @return {Integer}
def min_groups(intervals)
    intervals.sort!

    rights = MinHeap.new
    intervals.each { |(left, right)|
        # greedy:
        # if the previous right < the current left, that mean those intervals could be in the same group
        # hence we could remove the previous right, we only need to keep the last interval each group
        if !rights.empty? && rights.peak < left
            rights.extract_min
        end

        rights.add(right)
    }

    rights.size
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
