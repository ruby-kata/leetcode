# @param {Integer[]} nums
# @return {Integer}
def min_difference(nums)
    return 0 if nums.length < 5

    nums.sort!

    min_dist = Float::INFINITY
    (0..3).each do |i|
        min_dist = [min_dist, nums[nums.length - 4 + i] - nums[i]].min
    end

    min_dist
end
