# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    (0..nums.size).reduce(nums.reduce(0, :^), :^)
end
