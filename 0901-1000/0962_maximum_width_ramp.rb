# @param {Integer[]} nums
# @return {Integer}
def max_width_ramp(nums)
    # mono stack store index of nums in descending order
    stack = []
    (0...nums.size).each { |i|
        stack << i if stack.empty? || nums[stack.last] > nums[i]
    }

    max = 0
    (nums.size-1).downto(0) { |j|
        i = j
        # greedy
        # with each right-most index, find the left-most index that left-most num <= right-most num
        while !stack.empty? && nums[stack.last] <= nums[j]
            i = stack.pop
        end
        max = [max, j - i].max
    }

    max
end
