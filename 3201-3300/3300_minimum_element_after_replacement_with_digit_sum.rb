# @param {Integer[]} nums
# @return {Integer}
def min_element(nums)
    nums.map { |num| num.digits.sum }.min
end
