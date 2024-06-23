def search_insert(nums, target)
    lo = 0; hi = nums.length-1
    while lo < hi
        mid = (lo + hi) >> 1
        return mid if nums[mid] == target
        if nums[mid] > target
            hi = mid - 1
        else
            lo = mid + 1
        end
    end
    nums[lo] >= target ? lo : lo + 1
end
