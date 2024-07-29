# @param {Integer[]} nums
# @return {Integer[]}
def distinct_difference_array(nums)
    prefix_diff = []
    prefix_appear = Hash.new(false)
    (0...nums.size).each { |i|
        prefix_appear[nums[i]] = true
        prefix_diff[i] = prefix_appear.size
    }

    suffix_diff = []
    suffix_appear = Hash.new(false)
    (nums.size-1).downto(0).map { |i|
        suffix_diff[i] = suffix_appear.size
        suffix_appear[nums[i]] = true
    }

    (0...nums.size).map { |i| prefix_diff[i] - suffix_diff[i] }
end
