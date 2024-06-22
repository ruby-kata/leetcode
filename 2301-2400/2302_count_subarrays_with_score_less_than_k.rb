# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_subarrays(nums, k)
    count = 0
    lo = 0
    hi = 0
    sum = nums[0]

    loop do
        if (hi - lo + 1) * sum < k
            count += (hi - lo + 1)
            hi += 1
            break if hi >= nums.size
            sum += nums[hi]
        else
            if lo < hi
                sum -= nums[lo]
                lo += 1
            else
                lo += 1
                break if lo >= nums.size
                hi = lo
                sum = nums[lo]
            end
        end
    end

    count
end
