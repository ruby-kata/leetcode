# @param {Integer[]} nums
# @return {Integer[]}
def apply_operations(nums)
    i = 0
    while i < nums.length-1
        if nums[i] == nums[i+1]
            nums[i] *= 2
            nums[i+1] = 0
        end
        i += 1
    end

    i = j = 0
    while i < nums.length
        next(i += 1) if nums[i] > 0

        j = i if j < i
        j += 1 while nums[j] == 0
        break if j >= nums.length
        
        nums[j], nums[i] = nums[i], nums[j]
    end

    nums
end
