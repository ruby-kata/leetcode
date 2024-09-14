# @param {Integer[]} nums
# @return {Integer}
def longest_subarray(nums)
    # Notice that the bitwise AND of two different numbers will always be strictly less than the maximum of those two numbers.
    # so the max is always the result of the bitwise AND of the subarray of the max-nums
    # hence we only need to find the longest subarray if the max-nums
    longest = 1
    max = nums.first
    count = 1
    (1...nums.size).each { |i|
        if nums[i] < max
            longest = count if count > longest
            count = 0
        elsif nums[i] > max
            max = nums[i]
            count = 1
            longest = 1
        else
            count += 1
        end
    }

    longest = count if count > longest
    longest
end
