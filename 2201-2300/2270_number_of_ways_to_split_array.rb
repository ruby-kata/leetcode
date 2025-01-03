# @param {Integer[]} nums
# @return {Integer}
def ways_to_split_array(nums)
    prefix_sum = [0]
    nums.each { |num| prefix_sum << (prefix_sum.last + num) }
    (0...nums.size-1).count { |i| prefix_sum[i+1] >= prefix_sum.last - prefix_sum[i+1] }
end

# optimize
def ways_to_split_array(nums)
    total_sum = nums.sum
    prefix_sum = 0
    (0...nums.size-1).count { |i|
        prefix_sum += nums[i]
        prefix_sum >= total_sum - prefix_sum
    }
end
