# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def k_length_apart(nums, k)
    return true if k == 0 || nums.size == 1

    distance = 0
    i = nums.size - 1
    while i >= 0
        if nums[i] == 1
            return false if distance > 0
            distance = k
        else
            distance -= 1
        end
        i -= 1
    end

    true
end
