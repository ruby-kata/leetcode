# @param {Integer[]} nums
# @return {Integer[]}
def left_right_difference(nums)
    left_sum = Array.new(nums.length, 0)
    (1...nums.length).each { |i| left_sum[i] = left_sum[i-1] + nums[i-1] }

    right_sum = Array.new(nums.length, 0)
    (nums.length-2).downto(0) { |j| right_sum[j] = right_sum[j+1] + nums[j+1] }

    (0...nums.length).map { |i| (left_sum[i] - right_sum[i]).abs } 
end
