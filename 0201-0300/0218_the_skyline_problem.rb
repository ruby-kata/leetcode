# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
    x_coordinates = []
    buildings.each { |l, r, h| x_coordinates.push(l, r) }
    x_coordinates.sort!

    skyline = []
    min_heap = MinHeap.new
    i = 0
    x_coordinates.each { |x|
        # sort by max height, min left, min right
        # from the skyline view (flatten) at the x-coordinate, the most high building will overlap the others
        while i < buildings.size && buildings[i][0] <= x
            min_heap.add([-buildings[i][2], buildings[i][0], buildings[i][1]])
            i += 1
        end

        # discard all buildings have right <= x
        # since no more view on them from x to the right
        min_heap.extract_min while !min_heap.empty? && min_heap.peak[2] <= x
        
        # if no buildings in heap, that mean we reach the right-most of the previous block of buildings
        h = min_heap.empty? ? 0 : -min_heap.peak[0]
        # if it has the same high with the last view, skyline will not change the view, so ignore it
        next if !skyline.empty? && skyline[-1][1] == h 
        
        skyline << [x, h]
    }

    skyline
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
