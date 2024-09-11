# @param {Integer[]} nums
# @return {Integer}
def min_moves2(nums)
    nums.sort!
    
    median = nums.size.odd? ? nums[nums.size/2] : (nums[nums.size/2] + nums[nums.size/2 - 1])/2
    nums.inject(0) { |move, num| move += (num - median).abs }
end
