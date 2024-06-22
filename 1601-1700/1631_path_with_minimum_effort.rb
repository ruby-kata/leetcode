class Heap
    def initialize(comparator)
        @comparator = comparator
        @items = []
    end

    def push(x)
        @items.push(x)
        swim_up(@items.size-1)
    end

    def pop
        @items[0], @items[@items.size-1] = @items[@items.size-1], @items[0]
        x = @items.pop
        sink_down(0)
        x
    end

    def peak
        @items[0]
    end

    def empty?
        @items.empty?
    end

    private

        def parent(i)
            ((i-1)/2).floor
        end

        def left(i)
            2*i + 1
        end

        def right
            2*i + 2
        end

        def swim_up(i)
            pi = parent(i)
            if pi >= 0 && @comparator.call(@items[i], @items[pi]) <= 0
                @items[pi], @items[i] = @items[i], @items[pi]
                swim_up(pi)
            end
        end

        def sink_down(i)
            return if (li = left(i)) >= @items.size
            ri = li + 1
            swap_i = (li == @items.size-1 || @comparator.call(@items[li], @items[ri]) <= 0) ? li : ri
            if (@comparator.call(@items[swap_i], @items[i]) <= 0)
                @items[swap_i], @items[i] = @items[i], @items[swap_i]
                sink_down(swap_i)
            end
        end
end

# @param {Integer[][]} heights
# @return {Integer}
def minimum_effort_path(heights)
    rows = heights.size
    cols = heights[0].size
    directions = [[1,0],[0,1],[-1,0],[0,-1]]
    visited = Hash.new
    diff = Array.new(rows) { Array.new(cols, Float::INFINITY) }
    diff[0][0] = 0
    min_heap = Heap.new(->(h1, h2) { h1.last - h2.last })
    min_heap.push([0,0,0])

    until min_heap.empty?
        i, j, d = min_heap.pop
        return d if i == rows-1 && j == cols-1

        visited[[i, j]] = true
        directions.each do |(di, dj)|
            _i = i + di
            _j = j + dj
            if _i >= 0 && _j >= 0 && _i < rows && _j < cols && visited[[_i, _j]] != true
                _d = (heights[_i][_j] - heights[i][j]).abs
                _d = d if d > _d
                if _d < diff[_i][_j]
                    diff[_i][_j] = _d
                    min_heap.push([_i, _j, _d])
                end
            end
        end
    end
end
