# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
    return nums[0] if nums.size == 1

    lo = 0
    hi = nums.size - 1
    while lo < hi
        m = (lo + hi) / 2
        return nums[m] if nums[m] < nums[m-1] && nums[m] < nums[m+1]

        if nums[m] < nums[hi]
            hi = m - 1
        else
            lo = m + 1
        end
    end

    nums[lo]
end
