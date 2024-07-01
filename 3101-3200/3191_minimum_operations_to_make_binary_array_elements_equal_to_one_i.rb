# @param {Integer[]} nums
# @return {Integer}
def min_operations(nums)
    flip_count = 0
    flip = Array.new(nums.length, 0)
    (0..nums.length-3).each { |i|
        num = (flip[i-2] + flip[i-1]).odd? ? 1-nums[i] : nums[i]
        if num.zero?
            flip_count += 1
            flip[i] = 1
        end
    }

    return -1 if (-2..-1).any? { |i|
        (((flip[i-2] || 0) + flip[i-1]).odd? ? 1-nums[i] : nums[i]).zero?
    }

    flip_count
end
