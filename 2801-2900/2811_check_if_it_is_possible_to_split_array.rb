# @param {Integer[]} nums
# @param {Integer} m
# @return {Boolean}
def can_split_array(nums, m)
    return true if nums.size <= 2

    def can_split?(nums, m, sum, i, j, memo)
        return true if i == j
        return false if sum < m
        return memo[i][j] unless memo[i][j].nil?
        return memo[i][j] = can_split?(nums, m, sum - nums[i], i+1, j, memo) || 
                                    can_split?(nums, m, sum - nums[j], i, j-1, memo)
    end

    sum = nums.reduce(&:+)
    can_split?(nums, m, sum, 0, nums.size-1, Array.new(nums.size) { Array.new(nums.size) })
end
