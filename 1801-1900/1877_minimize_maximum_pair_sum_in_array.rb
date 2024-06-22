# @param {Integer[]} nums
# @return {Integer}
def min_pair_sum(nums)
    nums.sort!

    max = 0
    i, j = 0, nums.size-1
    while i < j
        sum = nums[i] + nums[j]
        max = sum if sum > max
        i += 1
        j -= 1
    end

    max
end
