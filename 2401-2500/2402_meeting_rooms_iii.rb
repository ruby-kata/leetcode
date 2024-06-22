class MinHeap
    def initialize
        @items = []
    end

    def push(x)
        @items.push(x)
        swim_up(@items.size-1)
    end

    def pop
        return if empty?

        swap(0, @items.size-1)
        min = @items.pop()
        sink_down(0)
        min
    end

    def peak
        @items.first
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

# @param {Integer} n
# @param {Integer[][]} meetings
# @return {Integer}
def most_booked(n, meetings)
    return 0 if n == 1

    meetings.sort!

    counter = Array.new(n, 0)
    available_rooms = Array.new(n, true)
    min_heap = MinHeap.new

    meetings.each do |(start_time, end_time)|
        et = -1
        until min_heap.empty? || min_heap.peak.first > start_time
            et, i = min_heap.pop
            available_rooms[i] = true
        end

        j = available_rooms.index(true)
        et, j = min_heap.pop if j.nil?

        t = et > start_time ? et + end_time - start_time : end_time 
        min_heap.push([t, j])
        counter[j] += 1
        available_rooms[j] = false
        
    end

    m = counter.max
    counter.index(m)
end
