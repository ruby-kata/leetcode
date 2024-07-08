# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k, l = 0, r = nums.size-1)
    pivot = nums[r]
    i = l-1
    j = l
    while j <= r
        if nums[j] >= pivot
            i += 1
            temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
        end
        j += 1
    end

    d = i - l + 1
    if d == k
        return pivot
    elsif d > k
        return find_kth_largest(nums, k, l, i-1)
    else
        return find_kth_largest(nums, k-d, i+1, r)
    end
end
