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

class SeatManager

=begin
    :type n: Integer
=end
    def initialize(n)
        @min_heap = MinHeap.new
        (1..n).each do |x|
            @min_heap.add(x)
        end
    end


=begin
    :rtype: Integer
=end
    def reserve()
        @min_heap.extract_min
    end


=begin
    :type seat_number: Integer
    :rtype: Void
=end
    def unreserve(seat_number)
        @min_heap.add(seat_number)        
    end


end

# Your SeatManager object will be instantiated and called as such:
# obj = SeatManager.new(n)
# param_1 = obj.reserve()
# obj.unreserve(seat_number)
