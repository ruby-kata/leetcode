# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
    # larger ^ smaller
    xor = nums.inject(&:^)
    # the right-most set bit of the larger one, which not set in the smaller
    most_significant = xor & (~(xor - 1))
    # xor all nums that has the most_significant set bit
    # because other has twice except the larger one, so xor all of them will be the larger
    larger = nums.inject(0) { |l, num| l ^= ((num & most_significant) != 0 ? num : 0) }
    [larger, xor ^ larger]
end
