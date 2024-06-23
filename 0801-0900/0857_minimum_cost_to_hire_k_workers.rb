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

# @param {Integer[]} quality
# @param {Integer[]} wage
# @param {Integer} k
# @return {Float}
def mincost_to_hire_workers(quality, wage, k)
    # sort by wage per quality which if we pick any of them and multiple with any previous quality, it will satisfy 2 required conditions:
    # [1]: picked_wage/picked_quality >= previous_wage/previous_quality => picked_wage/picked_quality * previous_quality >= previous_wage
    # [2]: with picked_wage as standard pay then picked_wage/picked_quality * previous_quality = the proportional of the previous_wage respect to the picked wage
    sorted_by_wpq = (0...wage.length).map { |i| [wage[i].to_f/quality[i], quality[i]] }.sort

    min_cost = Float::INFINITY
    max_heap = MaxHeap.new
    quality_sum = 0
    # greedy: with each wage_per_quality, select k smallest qualities come before it
    sorted_by_wpq.each do |wage_per_quality, q|
        quality_sum += q
        max_heap.add(q)
        quality_sum -= max_heap.extract_max if max_heap.size > k

        if max_heap.size == k
            min_cost = [min_cost, wage_per_quality * quality_sum].min
        end
    end
    
    min_cost
end
