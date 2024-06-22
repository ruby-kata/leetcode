# 2 queues
class MyStack
    def initialize()
        @queues = [[], []]
        @curr = 0
    end

    def push(x)
        @queues[@curr].push(x)
    end

    def pop()
        until @queues[@curr].size == 1
            !@queues[1-@curr].push(@queues[@curr].shift)
        end
        last = @queues[@curr].shift
        @curr = 1 - @curr
        last
    end

    def top()
        last = pop
        push(last)
        last
    end

    def empty()
        @queues[@curr].size == 0
    end
end
