# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_subarrays(nums, k)
    count = 0
    max = nums.max
    count_max = 0
    i = j = 0
    while i < nums.size
        count_max += 1 if nums[i] == max
        if count_max >= k
            until count_max < k
                count += nums.size - i
                count_max -= 1 if nums[j] == max
                j += 1
            end
        end

        i += 1
    end

    count
end
