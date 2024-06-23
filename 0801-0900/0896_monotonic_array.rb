# @param {Integer[]} nums
# @return {Boolean}
def is_monotonic(nums)
    d = 0
    i = 0
    i += 1 while i < nums.size-1 && (d = nums[i+1]-nums[i]) == 0
    
    sign = d[d.bit_length]
    while i < nums.size-1
        d = nums[i+1] - nums[i]
        return false if d != 0 && sign != d[d.bit_length]
        i += 1
    end

    true
end
