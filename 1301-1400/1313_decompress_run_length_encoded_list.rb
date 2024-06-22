# @param {Integer[]} nums
# @return {Integer[]}
def decompress_rl_elist(nums)
    (0..nums.length-2).step(2).map { |i|
        [nums[i+1]] * nums[i]
    }.flatten
end
