# @param {Integer[][]} grid
# @return {Integer}
def min_cost(grid)
    directions = [[0,1], [0,-1], [1,0], [-1,0]].freeze
    
    rows = grid.size
    cols = grid[0].size

    min_weights = Array.new(rows) { Array.new(cols, Float::INFINITY) }
    queue = MinHeap.new
    queue.add([0,0,0])

    until queue.empty?
        w, x, y = queue.extract_min
        return w if x == rows - 1 && y == cols -1

        directions.each_with_index { |(dx, dy), i| # index i + 1 == signs 1,2,3,4 
            next_x = x + dx
            next_y = y + dy
            d = grid[x][y] == i + 1 ? 0 : 1
            if next_x >= 0 && next_x < rows && next_y >= 0 && next_y < cols && 
                grid[next_x][next_y] > 0  && min_weights[next_x][next_y] > w + d
                min_weights[next_x][next_y] = w + d
                queue.add([w + d, next_x, next_y])
            end
        }
        grid[x][y] = 0
    end
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
