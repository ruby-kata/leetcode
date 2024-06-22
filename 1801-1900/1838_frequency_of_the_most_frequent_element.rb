# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_frequency(nums, k)
    nums.sort!

    max_count = 1
    count = 1
    i = 0
    j = 0
    repeat = 0
    while j < nums.size - 1
        while repeat + count * (nums[j+1] - nums[j]) > k
            repeat -= nums[j] - nums[i]
            i += 1
            count -= 1
        end
        
        repeat += count * (nums[j+1] - nums[j])
        j += 1
        count += 1
        max_count = count if count > max_count
    end

    max_count
end
