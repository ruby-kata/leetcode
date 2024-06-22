# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    k = 0
    i = 0
    while i < nums.length
        if nums[i] > nums[k]
            k += 1
            temp = nums[i]
            nums[i] = nums[k]
            nums[k] = temp
        end
        i += 1
    end

    k + 1
end
