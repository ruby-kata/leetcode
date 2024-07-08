# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_range_i(nums, k)
    min = Float::INFINITY
    max = -Float::INFINITY
    nums.each do |num|
        min = [min, num].min
        max = [max, num].max
    end

    [max - min - 2*k, 0].max
end
