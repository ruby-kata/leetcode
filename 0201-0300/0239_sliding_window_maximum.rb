class MonotonicQueue
    def initialize
        @queue = []
    end

    def add(x)
        extract_max until @queue.empty? || max >= x
        @queue.push(x)
    end

    def min
        @queue.first
    end

    def max
        @queue.last
    end

    def extract_min
        @queue.shift
    end

    def extract_max
        @queue.pop
    end
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
    return nums if k == 1

    max_queue = MonotonicQueue.new
    ans = []

    (0...k).each do |i|
        max_queue.add(nums[i])
    end
    ans.push(max_queue.min)

    (k..nums.size-1).each do |i|
        max_queue.add(nums[i])
        max_queue.extract_min if max_queue.min == nums[i-k]

        ans.push(max_queue.min)
    end

    ans
end
