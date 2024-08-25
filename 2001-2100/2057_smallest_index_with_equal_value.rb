# @param {Integer[]} nums
# @return {Integer}
def smallest_equal(nums)
    (0...nums.size).to_a.index { |i| i % 10 == nums[i] } || -1
end
