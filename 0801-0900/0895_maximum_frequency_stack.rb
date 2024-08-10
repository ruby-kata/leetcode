class FreqStack
    def initialize()
        @max_freq = 0
        @counter = Hash.new(0)
        @freq = Hash.new { |h, k| h[k] = [] }
    end

    def push(val)
        @counter[val] += 1
        @freq[@counter[val]] << val
        @max_freq = @counter[val] if @max_freq < @counter[val]
    end

    def pop()
        val = @freq[@max_freq].pop
        @counter[val] -= 1
        @max_freq -= 1 while @max_freq > 0 && @freq[@max_freq].empty?
        val
    end
end
