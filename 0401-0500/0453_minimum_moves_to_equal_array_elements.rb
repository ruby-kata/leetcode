# @param {Integer[]} nums
# @return {Integer}
def min_moves(nums)
    # incrementing n - 1 elements of the array by 1 equals to reducing the rest by 1.
    # so total moves equal to the sum of the diff between each num to the minimum.
    min = nums.min
    nums.inject(0) { |sum, num| sum += num - min }
end
