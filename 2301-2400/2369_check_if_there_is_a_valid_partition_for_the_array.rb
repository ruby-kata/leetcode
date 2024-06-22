# @param {Integer[]} nums
# @return {Boolean}
def valid_partition(nums)
    dp = Array.new(nums.size + 1) { false }
    dp[nums.size] = true

    (nums.size-2).downto(0) { |i|
        dp[i] = (nums[i] == nums[i+1] && dp[i+2]) ||
                (nums[i] == nums[i+1] && nums[i+1] == nums[i+2] && dp[i+3]) ||
                (nums[i] + 1 == nums[i+1] && nums[i+1] + 1 == nums[i+2] && dp[i+3])
    }

    dp[0]
end
