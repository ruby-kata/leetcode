# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer}
def min_patches(nums, n)
    count = 0
    appearances = Hash.new(false)
    i = 1
    j = 0
    while i <= n
        if j < nums.size && nums[j] <= i
            i += nums[j]
            j += 1
        else
            count += 1
            i += i
        end
    end

    count
end
