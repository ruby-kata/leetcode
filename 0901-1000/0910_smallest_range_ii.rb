# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_range_ii(nums, k)
    nums.sort!
    
    srange = nums.last - nums.first
    left = nums.first + k
    right = nums.last - k
    
    (0..nums.size-2).each do |i|
        min = [left, nums[i+1] - k].min
        max = [right, nums[i] + k].max
        srange = [srange, max - min].min
    end

    srange
end
