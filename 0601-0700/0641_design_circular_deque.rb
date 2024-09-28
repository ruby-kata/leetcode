class MyCircularDeque
    def initialize(k)
        @max = k
        @items = []
    end

    def insert_front(value)
        return false if @items.length >= @max

        @items.unshift(value)
        true
    end

    def insert_last(value)
        return false if @items.length >= @max

        @items.push(value)
        true
    end

    def delete_front()
        !@items.shift.nil?
    end

    def delete_last()
        !@items.pop.nil?
    end

    def get_front()
        @items.first || -1
    end

    def get_rear()
        @items.last || -1
    end

    def is_empty()
        @items.empty?
    end

    def is_full()
        @items.length == @max
    end
end
