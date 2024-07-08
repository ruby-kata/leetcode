class MyQueue
    def initialize()
        @in_stack = []
        @out_stack = [] 
    end

    def push(x)
        @in_stack.push(x)
    end

    def pop()
        flush_in_stack_to_out_stack if @out_stack.empty?
        @out_stack.pop
    end

    def peek()
        flush_in_stack_to_out_stack if @out_stack.empty?
        @out_stack.last
    end

    def empty()
        @out_stack.empty? and @in_stack.empty?
    end

    private def flush_in_stack_to_out_stack
        until @in_stack.empty?
            @out_stack.push(@in_stack.pop)
        end
    end
end
