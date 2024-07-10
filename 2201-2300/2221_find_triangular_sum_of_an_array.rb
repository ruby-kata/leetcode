# @param {Integer[]} nums
# @return {Integer}
def triangular_sum(nums)
    len = nums.length
    while len > 1
        (0...len-1).each { |i|
            nums[i] = (nums[i] + nums[i+1]) % 10
        }
        len -= 1
    end

    nums.first
end
