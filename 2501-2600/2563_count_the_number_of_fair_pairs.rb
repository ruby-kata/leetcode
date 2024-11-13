# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_fair_pairs(nums, lower, upper)
    nums.sort!

    count = 0
    (0...nums.size).each { |i|
        low = lower - nums[i]
        high = upper - nums[i]
        left = [i+1, nums.bsearch_index {|x| x >= low } || nums.size].max
        right = nums.bsearch_index {|x| x > high } || nums.size
        count += right - left if right > left
    }

    count
end
