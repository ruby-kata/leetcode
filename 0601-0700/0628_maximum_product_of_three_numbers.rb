# @param {Integer[]} nums
# @return {Integer}
def maximum_product(nums)
    nums.sort!
    [nums[-3] * nums[-2] * nums[-1], nums[0] * nums[1] * nums[-1]].max
end
