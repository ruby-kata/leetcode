# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
    sum = 0
    nums.map { |num| sum += num } 
end
