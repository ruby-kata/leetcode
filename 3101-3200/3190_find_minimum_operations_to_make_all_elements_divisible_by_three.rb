# @param {Integer[]} nums
# @return {Integer}
def minimum_operations(nums)
    nums.count { |num| (num % 3) != 0 }
end
