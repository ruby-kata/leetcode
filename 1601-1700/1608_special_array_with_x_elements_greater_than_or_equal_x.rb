# @param {Integer[]} nums
# @return {Integer}
def special_array(nums)
    nums.sort!.reverse!

    low = 0
    high = nums.length
    while low < high
        mid = (low + high) / 2
        if nums[mid] >= mid + 1
            low = mid + 1
        else
            high = mid
        end
    end

    return -1 if low <= 0
    return nums.length if low >= nums.length
    nums[low] < low ? low : -1
end
