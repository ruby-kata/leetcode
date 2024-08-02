# @param {Integer[]} nums
# @return {Integer}
def min_swaps(nums)
    # sliding-window size = total ones
    total_ones = nums.count { |num| num == 1 }
    # circular
    nums += nums
    # number of swaps = number of zeros
    zeros = 0
    (0...total_ones).each { |i|
        zeros += (nums[i] == 0 ? 1 : 0)
    }
    min = zeros

    (total_ones...nums.length).each { |i|
        zeros += (nums[i] == 0 ? 1 : 0) - (nums[i-total_ones] == 0 ? 1 : 0)
        min = [min, zeros].min
    }

    min
end
