# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k, start = 0)
    return nums if (nums.size - start) == 1
    return nums if (swap = k % (nums.size-start)) == 0
    
    left = start
    right = nums.size - swap
    swap.times do |i|
        l = left + i
        r = right + i
        temp = nums[l]
        nums[l] = nums[r]
        nums[r] = temp
    end

    rotate(nums, swap, start + swap)
end
