# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares(nums)
    squares = []
    l = 0
    r = nums.size-1
    while l <= r
        if nums[r].abs > nums[l].abs
            squares.unshift(nums[r] * nums[r])
            r -= 1
        else
            squares.unshift(nums[l] * nums[l])
            l += 1
        end
    end

    squares
end
