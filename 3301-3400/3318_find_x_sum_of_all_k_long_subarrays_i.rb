# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def find_x_sum(nums, k, x)
    (0..nums.size-k).map { |i|
        nums[i..i+k-1]
            .tally
            .map { |num, count| [count, num] }.sort.reverse.take(x)
            .sum { |count, num| num * count }
    }
end
