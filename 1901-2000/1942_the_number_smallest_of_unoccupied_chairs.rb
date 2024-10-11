# @param {Integer[][]} times
# @param {Integer} target_friend
# @return {Integer}
def smallest_chair(times, target_friend)
    chairs = Array.new(times.size, false)
    seat = Hash.new

    sorted_times = []
    times.each_with_index do |(arrive, leave), i|
        sorted_times.push([arrive, 1, i])
        sorted_times.push([leave, 0, i])
    end
    sorted_times.sort! { |t1, t2| t1[0] == t2[0] ? t1[1] - t2[1] : t1[0] - t2[0] }

    min_free_chair = 0
    sorted_times.each do |t, arrive, i|
        if arrive == 1
            seat[i] = min_free_chair
            chairs[min_free_chair] = true
            min_free_chair += 1 while chairs[min_free_chair]
        else
            min_free_chair = seat[i] if min_free_chair > seat[i]
            chairs[seat[i]] = false
        end
        return seat[i] if i == target_friend
    end
end


# Min Heap
def smallest_chair(times, target_friend)
    chairs = MinHeap.new(0...times.size)
    occupied = MinHeap.new

    ordered_times = times.map.with_index { |(arrival, leaving), i| [arrival, leaving, i] }.sort
    ordered_times.each { |arrival, leaving, i|
        while !occupied.empty? && occupied.peak[0] <= arrival
            chairs.add(occupied.extract_min[1])
        end
        min_free_chair = chairs.extract_min
        return min_free_chair if i == target_friend
        occupied.add([leaving, min_free_chair])
    }

    -1
end

class MinHeap
    def initialize(values = [])
        @items = []
        values.each { |v| add(v) }
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
    
    def peak
        @items[0]
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
