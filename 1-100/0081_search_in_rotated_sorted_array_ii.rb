# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target, lo = 0, hi = nums.size - 1)
    while lo <= hi
        m = (lo + hi) / 2
        return true if target == nums[m] || target == nums[lo] || target == nums[hi]

        if nums[m] == nums[lo] && nums[m] == nums[hi]
            return search(nums, target, lo, m - 1) || search(nums, target, m + 1, hi)
        else
            if nums[m] <= nums[hi]
                if target > nums[m] && target < nums[hi]
                    lo = m + 1
                else
                    hi = m - 1
                end
            else
                if target < nums[m] && target > nums[lo]
                    hi = m - 1
                else
                    lo = m + 1
                end
            end
        end
    end

    false
end
