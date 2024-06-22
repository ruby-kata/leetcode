# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
    max = nums[0]
    i = 1
    while i < nums.length && i <= max && max < nums.length-1
        max = [max, nums[i] + i].max
        i += 1
    end

    max >= nums.length-1
end
