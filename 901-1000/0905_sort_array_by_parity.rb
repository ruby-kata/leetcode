# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity(nums)
    l = 0
    r = nums.size - 1
    while l < r
        if nums[l].even?
            l += 1
        else
            if nums[r].odd?
                r -= 1
            else
                nums[l], nums[r] = nums[r], nums[l]
                l += 1
                r -= 1
            end
        end
    end

    nums
end
