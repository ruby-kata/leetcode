# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def minimum_difference(nums, k)
    nums.sort!.each_cons(k).map { |arr| arr[-1] - arr[0] }.min
end
