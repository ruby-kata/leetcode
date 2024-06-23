# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
    lo, hi = 0, nums.length-1
    while lo <= hi
        mid = (lo + hi) >> 1
        return mid if nums[mid] == target

        if nums[lo] <= nums[mid]
            if nums[lo] <= target and target <= nums[mid]
                hi = mid - 1
            else
                lo = mid + 1
            end
        else
            if nums[mid] <= target and target <= nums[hi]
                lo = mid + 1
            else
                hi = mid - 1
            end
        end
    end

    -1
end
