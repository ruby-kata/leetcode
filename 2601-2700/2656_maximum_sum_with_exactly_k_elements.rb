# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def maximize_sum(nums, k)
    nums.max * k + (k-1)*k/2
end
