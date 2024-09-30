class CustomStack
    def initialize(max_size)
        @max_size = max_size
        @items = []
    end

    def push(x)
        return if @items.size >= @max_size
        @items.push(x)
    end

    def pop()
        @items.pop || -1
    end

    def increment(k, val)
        (0...[@items.size, k].min).each { |i| @items[i] += val }
    end
end
