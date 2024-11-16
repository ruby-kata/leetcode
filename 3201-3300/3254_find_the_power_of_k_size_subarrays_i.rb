# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def results_array(nums, k)
    return nums if nums.size == 1 || k == 1

    result = Array.new(nums.size - k + 1, -1)
    i = j = 0
    while i <= nums.size - k
        if nums[j] + 1 == nums[j+1]
            j += 1
            if j - i + 1 == k
                result[i] = nums[i..j].max
                i += 1
            end
        else
            i = j += 1
        end
    end

    result
end
